import 'package:flutter/material.dart';

import '../../core/state/favoritos_controller.dart';
import '../../data/models/pelicula.dart';
import '../../data/repositories/pelicula_repository.dart';
import '../widgets/error_mensaje.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/pelicula_card.dart';
import 'acerca_screen.dart';
import 'busqueda_screen.dart';
import 'favoritos_screen.dart';

class HomeScreen extends StatefulWidget {
  final PeliculaRepository repository;
  final FavoritosController favoritosController;

  const HomeScreen({
    required this.repository,
    required this.favoritosController,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Pelicula>> _peliculasFuture;

  @override
  void initState() {
    super.initState();
    _peliculasFuture = widget.repository.obtenerPeliculas();
  }

  void _recargar() {
    setState(() {
      _peliculasFuture = widget.repository.obtenerPeliculas();
    });
  }

  Future<void> _abrirBusqueda() async {
    final peliculas = await _peliculasFuture;

    if (!mounted) {
      return;
    }

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BusquedaScreen(
          peliculas: peliculas,
          favoritosController: widget.favoritosController,
        ),
      ),
    );
  }

  Future<void> _abrirFavoritos() async {
    final peliculas = await _peliculasFuture;

    if (!mounted) {
      return;
    }

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FavoritosScreen(
          peliculas: peliculas,
          favoritosController: widget.favoritosController,
        ),
      ),
    );
  }

  void _abrirAcerca() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const AcercaScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Películas'),
        actions: [
          IconButton(
            tooltip: 'Buscar',
            onPressed: _abrirBusqueda,
            icon: const Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Favoritos',
            onPressed: _abrirFavoritos,
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            tooltip: 'Acerca de',
            onPressed: _abrirAcerca,
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: FutureBuilder<List<Pelicula>>(
        future: _peliculasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }

          if (snapshot.hasError) {
            return ErrorMensaje(
              mensaje:
                  'No se pudieron cargar las películas.\n\n'
                  '${snapshot.error}',
              onRetry: _recargar,
            );
          }

          final peliculas = snapshot.data ?? <Pelicula>[];

          if (peliculas.isEmpty) {
            return const Center(child: Text('No hay películas disponibles.'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 320,
              childAspectRatio: 0.72,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: peliculas.length,
            itemBuilder: (_, index) {
              return PeliculaCard(
                pelicula: peliculas[index],
                favoritosController: widget.favoritosController,
              );
            },
          );
        },
      ),
    );
  }
}
