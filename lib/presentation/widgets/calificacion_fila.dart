import 'package:flutter/material.dart';

class CalificacionFila extends StatelessWidget {
  final double calificacion;

  const CalificacionFila({required this.calificacion, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
        Text(calificacion.toStringAsFixed(1)),
      ],
    );
  }
}
