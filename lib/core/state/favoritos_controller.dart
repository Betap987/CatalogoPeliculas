import 'package:flutter/foundation.dart';

import '../../data/models/pelicula.dart';

class FavoritosController extends ChangeNotifier {
  final Set<int> _ids = <int>{};

  bool esFavorita(Pelicula pelicula) {
    return _ids.contains(pelicula.id);
  }

  void alternar(Pelicula pelicula) {
    if (_ids.contains(pelicula.id)) {
      _ids.remove(pelicula.id);
    } else {
      _ids.add(pelicula.id);
    }

    notifyListeners();
  }

  List<Pelicula> filtrarFavoritos(List<Pelicula> peliculas) {
    return peliculas.where((pelicula) => _ids.contains(pelicula.id)).toList();
  }
}
