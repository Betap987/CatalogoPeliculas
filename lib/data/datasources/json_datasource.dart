import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_56/data/models/pelicula.dart';

class DatosException implements Exception {
  final String mensaje;
  const DatosException(this.mensaje);

  @override
  String toString() => mensaje;
}

class JsonDatasource {
  static const String _ruta = 'assets/data/peliculas.json';

  Future<List<Pelicula>> cargarPeliculas() async {
    try {
      final raw = await rootBundle.loadString(_ruta);
      final decoded = json.decode(raw);

      if (decoded is! Map<String, dynamic> || decoded['peliculas'] is! List) {
        throw const DatosException(
            "El JSON debe ser un objeto con una lista llamada 'peliculas'.");
      }

      return (decoded['peliculas'] as List)
          .map((e) => Pelicula.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DatosException {
      rethrow;
    } on FormatException catch (e) {
      throw DatosException('El archivo JSON está mal formado: ${e.message}');
    } on TypeError {
      throw const DatosException(
          'Una película tiene un campo faltante o con tipo incorrecto.');
    } catch (_) {
      throw const DatosException('No se pudo leer el archivo de películas.');
    }
  }
}