import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/state/favoritos_controller.dart';
import '../../data/models/pelicula.dart';

class BotonFavorito extends StatelessWidget {
  final Pelicula pelicula;
  final FavoritosController controller;

  const BotonFavorito({
    required this.pelicula,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        final favorito = controller.esFavorita(pelicula);

        return IconButton(
          tooltip: favorito ? 'Quitar de favoritos' : 'Agregar a favoritos',
          onPressed: () => controller.alternar(pelicula),
          icon: Icon(
            favorito ? Icons.favorite : Icons.favorite_border,
            color: favorito ? AppColors.favorite : null,
          ),
        );
      },
    );
  }
}
