import 'package:flutter/material.dart';

class PlaceholderImagen extends StatelessWidget {
  final double? height;

  const PlaceholderImagen({this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.black12,
      alignment: Alignment.center,
      child: const Icon(Icons.movie_outlined, size: 60),
    );
  }
}
