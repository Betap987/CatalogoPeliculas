import 'package:flutter_application_56/data/datasources/json_datasource.dart';
import 'package:flutter_application_56/data/models/pelicula.dart';

class PeliculaRepository {
  PeliculaRepository._();
  static final PeliculaRepository instancia = PeliculaRepository._();

  final JsonDatasource _datasource = JsonDatasource();
  List<Pelicula>? _cache; // el JSON se lee una sola vez

  Future<List<Pelicula>> obtenerTodas() async {
    _cache ??= await _datasource.cargarPeliculas();
    return _cache!;
  }

  Future<List<Pelicula>> buscar(String texto) async {
    final todas = await obtenerTodas();
    final q = texto.trim().toLowerCase();
    if (q.isEmpty) return todas;
    return todas
        .where((p) =>
            p.titulo.toLowerCase().contains(q) ||
            p.genero.toLowerCase().contains(q) ||
            p.director.toLowerCase().contains(q))
        .toList();
  }

  Future<List<Pelicula>> porIds(Set<int> ids) async {
    final todas = await obtenerTodas();
    return todas.where((p) => ids.contains(p.id)).toList();
  }
}