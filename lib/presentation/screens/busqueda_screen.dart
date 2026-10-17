import 'package:flutter/material.dart';

import '../../core/state/favoritos_controller.dart';
import '../../data/models/pelicula.dart';
import '../widgets/barra_busqueda.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/pelicula_card.dart';

class BusquedaScreen extends StatefulWidget {
  final List<Pelicula> peliculas;
  final FavoritosController favoritosController;

  const BusquedaScreen({
    required this.peliculas,
    required this.favoritosController,
    super.key,
  });

  @override
  State<BusquedaScreen> createState() => _BusquedaScreenState();
}

class _BusquedaScreenState extends State<BusquedaScreen> {
  final TextEditingController _controller = TextEditingController();
  String _texto = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultados = widget.peliculas.where((pelicula) {
      return pelicula.titulo.toLowerCase().contains(_texto.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar pelÃ­culas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: BarraBusqueda(
              controller: _controller,
              onChanged: (value) {
                setState(() => _texto = value);
              },
            ),
          ),
          Expanded(
            child: resultados.isEmpty
                ? const EstadoVacio(
                    mensaje: 'No se encontraron pelÃ­culas.',
                    icono: Icons.search_off,
                  )
                : GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 320,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: resultados.length,
                    itemBuilder: (_, index) {
                      return PeliculaCard(
                        pelicula: resultados[index],
                        favoritosController: widget.favoritosController,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
