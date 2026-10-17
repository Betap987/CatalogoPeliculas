import '../datasources/pelicula_datasource.dart';
import '../models/pelicula.dart';

class PeliculaRepository {
  final PeliculaDatasource datasource;

  PeliculaRepository({PeliculaDatasource? datasource})
    : datasource = datasource ?? PeliculaDatasource();

  Future<List<Pelicula>> obtenerPeliculas() async {
    final datos = await datasource.obtenerPeliculas();

    return datos.map(Pelicula.fromJson).toList();
  }
}
