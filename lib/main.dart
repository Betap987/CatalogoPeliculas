import 'package:flutter/material.dart';

import 'core/state/favoritos_controller.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/pelicula_repository.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const CatalogoPeliculasApp());
}

class CatalogoPeliculasApp extends StatelessWidget {
  const CatalogoPeliculasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Películas',
      theme: AppTheme.light(),
      home: HomeScreen(
        repository: PeliculaRepository(),
        favoritosController: FavoritosController(),
      ),
    );
  }
}
