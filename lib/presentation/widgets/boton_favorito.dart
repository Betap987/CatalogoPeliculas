
import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';

class BotonFavorito extends StatelessWidget {
  final bool esFavorito;
  final VoidCallback onPressed;

  const BotonFavorito({
    super.key,
    required this.esFavorito,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: esFavorito
          ? 'Quitar de favoritos'
          : 'Agregar a favoritos',
      icon: Icon(
        esFavorito ? Icons.favorite : Icons.favorite_border,
        color: esFavorito
            ? AppColors.error
            : AppColors.textoSecundario,
      ),
    );
  }
}
