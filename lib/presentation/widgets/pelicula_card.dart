import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';
import 'package:flutter_application_56/data/models/pelicula.dart';
import 'package:flutter_application_56/presentation/widgets/calificacion_badge.dart';
import 'package:flutter_application_56/presentation/widgets/genero_chip.dart';
import 'package:flutter_application_56/presentation/widgets/pelicula_imagen.dart';

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;
  final VoidCallback onTap;
  final Widget? trailing;

  const PeliculaCard({
    super.key,
    required this.pelicula,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.superficie,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              PeliculaImagen(url: pelicula.imagen, ancho: 80, alto: 110),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pelicula.titulo,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${pelicula.anio} · ${pelicula.duracion} min',
                      style: const TextStyle(
                        color: AppColors.textoSecundario,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        GeneroChip(genero: pelicula.genero),
                        CalificacionBadge(calificacion: pelicula.calificacion),
                      ],
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
