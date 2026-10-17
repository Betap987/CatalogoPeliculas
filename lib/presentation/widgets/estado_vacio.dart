
import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';

class EstadoVacio extends StatelessWidget {
  final IconData icono;
  final String mensaje;

  const EstadoVacio({
    super.key,
    required this.icono,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icono,
              size: 64,
              color: AppColors.acento,
            ),
            const SizedBox(height: 12),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textoSecundario,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
