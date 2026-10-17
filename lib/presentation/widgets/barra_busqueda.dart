
import 'package:flutter/material.dart';
import 'package:flutter_application_56/core/constants/app_colors.dart';

class BarraBusqueda extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hint;

  const BarraBusqueda({
    super.key,
    required this.onChanged,
    this.hint = 'Buscar película, género o director',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.textoSecundario,
        ),
        filled: true,
        fillColor: AppColors.superficie,
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
