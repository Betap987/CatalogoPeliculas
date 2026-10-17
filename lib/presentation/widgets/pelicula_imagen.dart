import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';

class PeliculaImagen extends StatelessWidget {
  final String url;
  final double? ancho;
  final double? alto;
  final double radio;
  final BoxFit fit;

  const PeliculaImagen({
    super.key,
    required this.url,
    this.ancho,
    this.alto,
    this.radio = 12,
    this.fit = BoxFit.cover,
  });

  Widget _placeholder(Widget hijo) {
    return Container(
      width: ancho,
      height: alto,
      color: AppColors.acentoSuave,
      child: Center(child: hijo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radio),
      child: Image.network(
        url,
        width: ancho,
        height: alto,
        fit: fit,
        loadingBuilder: (context, child, progreso) {
          if (progreso == null) return child;

          return _placeholder(
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (_, _, _) {
          return _placeholder(
            const Icon(Icons.movie_outlined, color: AppColors.textoSecundario),
          );
        },
      ),
    );
  }
}
