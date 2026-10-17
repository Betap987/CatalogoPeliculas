import 'package:flutter/material.dart';

class EstadoVacio extends StatelessWidget {
  final String mensaje;
  final IconData icono;

  const EstadoVacio({
    required this.mensaje,
    this.icono = Icons.movie_outlined,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 64),
          const SizedBox(height: 12),
          Text(mensaje),
        ],
      ),
    );
  }
}
