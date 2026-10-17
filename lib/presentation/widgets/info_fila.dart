
import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';

class InfoFila extends StatelessWidget {
  final IconData icono;
  final String texto;

  const InfoFila({
    super.key,
    required this.icono,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icono,
            size: 18,
            color: AppColors.primario,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              texto,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
