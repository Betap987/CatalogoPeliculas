import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';

class GeneroChip extends StatelessWidget {
  final String genero;

  const GeneroChip({super.key, required this.genero});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.acentoSuave,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genero,
        style: const TextStyle(fontSize: 12, color: AppColors.primario),
      ),
    );
  }
}
