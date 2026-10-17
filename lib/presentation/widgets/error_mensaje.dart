
import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';

class ErrorMensaje extends StatelessWidget {
  final String mensaje;
  final VoidCallback? onReintentar;

  const ErrorMensaje({
    super.key,
    required this.mensaje,
    this.onReintentar,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 56,
              color: AppColors.error,
            ),
            const SizedBox(height: 12),
            Text(
              mensaje,
              textAlign: TextAlign.center,
            ),
            if (onReintentar != null) ...[
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: onReintentar,
                child: const Text('Reintentar'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
