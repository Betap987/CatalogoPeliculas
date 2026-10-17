import 'package:flutter/material.dart';

import '../../core/state/favoritos_controller.dart';
import '../../data/models/pelicula.dart';
import '../widgets/boton_favorito.dart';
import '../widgets/calificacion_fila.dart';
import '../widgets/genero_chip.dart';
import '../widgets/info_fila.dart';
import '../widgets/poster_pelicula.dart';
import '../widgets/titulo_seccion.dart';

class DetalleScreen extends StatelessWidget {
  final Pelicula pelicula;
  final FavoritosController favoritosController;

  const DetalleScreen({
    required this.pelicula,
    required this.favoritosController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pelicula.titulo),
        actions: [
          BotonFavorito(pelicula: pelicula, controller: favoritosController),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: PosterPelicula(url: pelicula.imagen, height: 360),
            ),
            const SizedBox(height: 20),
            Text(
              pelicula.titulo,
              style: Theme.of(context).textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                GeneroChip(genero: pelicula.genero),
                const SizedBox(width: 12),
                CalificacionFila(calificacion: pelicula.calificacion),
              ],
            ),
            const SizedBox(height: 20),
            InfoFila(
              etiqueta: 'Año',
              valor: pelicula.anio.toString(),
              icono: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: 12),
            InfoFila(
              etiqueta: 'Duración',
              valor: '${pelicula.duracion} minutos',
              icono: Icons.schedule_outlined,
            ),
            const SizedBox(height: 12),
            InfoFila(
              etiqueta: 'Director',
              valor: pelicula.director,
              icono: Icons.person_outline,
            ),
            const SizedBox(height: 24),
            const TituloSeccion(titulo: 'Sinopsis'),
            const SizedBox(height: 8),
            Text(
              pelicula.sinopsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
