import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/state/favoritos_controller.dart';
import 'package:flutter_application_56/data/models/pelicula.dart';
import 'package:flutter_application_56/data/repositories/pelicula_repository.dart';
import 'package:flutter_application_56/presentation/screens/detalle_screen.dart';
import 'package:flutter_application_56/presentation/widgets/boton_favorito.dart';
import 'package:flutter_application_56/presentation/widgets/error_mensaje.dart';
import 'package:flutter_application_56/presentation/widgets/estado_vacio.dart';
import 'package:flutter_application_56/presentation/widgets/loading_indicator.dart';
import 'package:flutter_application_56/presentation/widgets/pelicula_card.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritas')),
      body: ValueListenableBuilder<Set<int>>(
        valueListenable: favoritosController.ids,
        builder: (context, ids, _) {
          return FutureBuilder<List<Pelicula>>(
            future: PeliculaRepository.instancia.porIds(ids),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  !snapshot.hasData) {
                return const LoadingIndicator();
              }
              if (snapshot.hasError) {
                return ErrorMensaje(mensaje: snapshot.error.toString());
              }
              final lista = snapshot.data ?? [];
              if (lista.isEmpty) {
                return const EstadoVacio(
                  icono: Icons.favorite_border,
                  mensaje: 'Aún no tienes películas favoritas',
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: lista.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final p = lista[i];
                  return PeliculaCard(
                    pelicula: p,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalleScreen(pelicula: p),
                      ),
                    ),
                    trailing: BotonFavorito(
                      esFavorito: true,
                      onPressed: () => favoritosController.alternar(p.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}