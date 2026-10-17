import 'dart:convert';

import 'package:flutter/services.dart';

class PeliculaDatasource {
  Future<List<Map<String, dynamic>>> obtenerPeliculas() async {
    final contenido = await rootBundle.loadString('assets/data/peliculas.json');

    final decoded = jsonDecode(contenido);

    if (decoded is List) {
      return decoded
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();
    }

    if (decoded is Map) {
      final posiblesClaves = <String>['peliculas', 'movies', 'data', 'items'];

      for (final clave in posiblesClaves) {
        final valor = decoded[clave];

        if (valor is List) {
          return valor
              .map((item) => Map<String, dynamic>.from(item as Map))
              .toList();
        }
      }

      for (final valor in decoded.values) {
        if (valor is List) {
          return valor
              .map((item) => Map<String, dynamic>.from(item as Map))
              .toList();
        }
      }
    }

    throw const FormatException(
      'El archivo JSON no contiene una lista de películas válida.',
    );
  }
}
