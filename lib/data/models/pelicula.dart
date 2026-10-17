class Pelicula {
  final int id;
  final String titulo;
  final int anio;
  final String genero;
  final int duracion;
  final String director;
  final double calificacion;
  final String sinopsis;
  final String imagen;

  const Pelicula({
    required this.id,
    required this.titulo,
    required this.anio,
    required this.genero,
    required this.duracion,
    required this.director,
    required this.calificacion,
    required this.sinopsis,
    required this.imagen,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      anio: json['anio'] as int,
      genero: json['genero'] as String,
      duracion: json['duracion'] as int,
      director: json['director'] as String,
      calificacion: (json['calificacion'] as num).toDouble(),
      sinopsis: json['sinopsis'] as String,
      imagen: json['imagen'] as String,
    );
  }
}