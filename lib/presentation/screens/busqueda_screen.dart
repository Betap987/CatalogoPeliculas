import 'package:flutter/material.dart';
import 'package:flutter_application_56/data/models/pelicula.dart';
import 'package:flutter_application_56/data/repositories/pelicula_repository.dart';
import 'package:flutter_application_56/presentation/screens/detalle_screen.dart';
import 'package:flutter_application_56/presentation/widgets/barra_busqueda.dart';
import 'package:flutter_application_56/presentation/widgets/error_mensaje.dart';
import 'package:flutter_application_56/presentation/widgets/estado_vacio.dart';
import 'package:flutter_application_56/presentation/widgets/loading_indicator.dart';
import 'package:flutter_application_56/presentation/widgets/pelicula_card.dart';

class BusquedaScreen extends StatefulWidget {
  const BusquedaScreen({super.key});

  @override
  State<BusquedaScreen> createState() => _BusquedaScreenState();
}

class _BusquedaScreenState extends State<BusquedaScreen> {
  List<Pelicula> _resultados = [];
  bool _cargando = true;
  String? _error;
  String _texto = '';

  @override
  void initState() {
    super.initState();
    _buscar('');
  }

  Future<void> _buscar(String texto) async {
    _texto = texto;
    try {
      final r = await PeliculaRepository.instancia.buscar(texto);
      if (!mounted || texto != _texto) return; // ignora respuestas viejas
      setState(() {
        _resultados = r;
        _error = null;
        _cargando = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _cargando = false;
      });
    }
  }

  Widget _contenido() {
    if (_cargando) {
      return const LoadingIndicator(mensaje: 'Cargando películas...');
    }
    if (_error != null) {
      return ErrorMensaje(
        mensaje: _error!,
        onReintentar: () {
          setState(() {
            _cargando = true;
            _error = null;
          });
          _buscar(_texto);
        },
      );
    }
    if (_resultados.isEmpty) {
      return const EstadoVacio(
        icono: Icons.search_off,
        mensaje: 'No se encontraron películas',
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _resultados.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final p = _resultados[i];
        return PeliculaCard(
          pelicula: p,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetalleScreen(pelicula: p)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: BarraBusqueda(onChanged: _buscar),
          ),
          Expanded(child: _contenido()),
        ],
      ),
    );
  }
}