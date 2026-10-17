import 'package:flutter/material.dart';
import 'package:flutter_application_56/data/models/pelicula.dart';
import 'package:flutter_application_56/presentation/widgets/calificacion_badge.dart';
import 'package:flutter_application_56/presentation/widgets/genero_chip.dart';
import 'package:flutter_application_56/presentation/widgets/pelicula_imagen.dart';

class DetalleScreen extends StatelessWidget {
  final Pelicula pelicula;

  const DetalleScreen({super.key, required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de película')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PeliculaImagen(
              url: pelicula.imagen,
              ancho: double.infinity,
              alto: 360,
              radio: 16,
            ),
            const SizedBox(height: 20),
            Text(
              pelicula.titulo,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                GeneroChip(genero: pelicula.genero),
                CalificacionBadge(calificacion: pelicula.calificacion),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${pelicula.anio} · ${pelicula.duracion} minutos',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Director: ${pelicula.director}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Text(
              'Sinopsis',
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
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
