import 'package:flutter/material.dart';

class TituloSeccion extends StatelessWidget {
  final String titulo;

  const TituloSeccion({required this.titulo, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: Theme.of(context).textTheme.titleLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
