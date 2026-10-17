import 'package:flutter/material.dart';

import '../../core/state/favoritos_controller.dart';
import '../../data/models/pelicula.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/pelicula_card.dart';

class FavoritosScreen extends StatelessWidget {
  final List<Pelicula> peliculas;
  final FavoritosController favoritosController;

  const FavoritosScreen({
    required this.peliculas,
    required this.favoritosController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: AnimatedBuilder(
        animation: favoritosController,
        builder: (_, _) {
          final favoritos = favoritosController.filtrarFavoritos(peliculas);

          if (favoritos.isEmpty) {
            return const EstadoVacio(
              mensaje: 'Todavía no tienes películas favoritas.',
              icono: Icons.favorite_border,
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 320,
              childAspectRatio: 0.72,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: favoritos.length,
            itemBuilder: (_, index) {
              return PeliculaCard(
                pelicula: favoritos[index],
                favoritosController: favoritosController,
              );
            },
          );
        },
      ),
    );
  }
}
