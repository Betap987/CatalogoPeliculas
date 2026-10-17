import 'package:flutter/material.dart';

import 'placeholder_imagen.dart';

class PosterPelicula extends StatelessWidget {
  final String url;
  final double? height;
  final BoxFit fit;

  const PosterPelicula({
    required this.url,
    this.height,
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return PlaceholderImagen(height: height);
    }

    return Image.network(
      url,
      height: height,
      width: double.infinity,
      fit: fit,
      errorBuilder: (_, _, _) {
        return PlaceholderImagen(height: height);
      },
    );
  }
}
