import 'package:flutter/foundation.dart';

class FavoritosController {
  final ValueNotifier<Set<int>> ids = ValueNotifier<Set<int>>({});

  bool esFavorito(int id) => ids.value.contains(id);

  void alternar(int id) {
    final nuevo = {...ids.value};
    if (!nuevo.remove(id)) nuevo.add(id);
    ids.value = nuevo; // Set nuevo para que el notifier avise del cambio
  }
}

// Instancia compartida por toda la app
final FavoritosController favoritosController = FavoritosController();