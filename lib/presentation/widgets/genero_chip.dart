import 'package:flutter/material.dart';

class GeneroChip extends StatelessWidget {
  final String genero;

  const GeneroChip({required this.genero, super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.category_outlined, size: 18),
      label: Text(genero),
    );
  }
}
