
import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final String? mensaje;

  const LoadingIndicator({
    super.key,
    this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            color: AppColors.primario,
          ),
          if (mensaje != null) ...[
            const SizedBox(height: 12),
            Text(
              mensaje!,
              style: const TextStyle(
                color: AppColors.textoSecundario,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
