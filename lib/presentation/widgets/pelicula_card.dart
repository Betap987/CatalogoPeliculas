import 'package:flutter/material.dart';

import '../../core/state/favoritos_controller.dart';
import '../../data/models/pelicula.dart';
import '../screens/detalle_screen.dart';
import 'boton_favorito.dart';
import 'calificacion_fila.dart';
import 'poster_pelicula.dart';

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;
  final FavoritosController favoritosController;

  const PeliculaCard({
    required this.pelicula,
    required this.favoritosController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetalleScreen(
                pelicula: pelicula,
                favoritosController: favoritosController,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: PosterPelicula(
                      url: pelicula.imagen,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: BotonFavorito(
                      pelicula: pelicula,
                      controller: favoritosController,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pelicula.titulo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('${pelicula.anio} • ${pelicula.genero}'),
                  const SizedBox(height: 6),
                  CalificacionFila(calificacion: pelicula.calificacion),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
