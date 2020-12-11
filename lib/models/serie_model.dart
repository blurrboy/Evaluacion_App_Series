import 'package:flutter/foundation.dart';

class Serie {
  final String id;
  final String tituloOriginal;
  final String tituloTraduccion;
  final int numTemporadas;
  final int numEpisodios;
  final double calificacionImbd;
  final String productorSerie;

  Serie({
    @required this.id,
    @required this.tituloOriginal,
    @required this.tituloTraduccion,
    @required this.numTemporadas,
    @required this.numEpisodios,
    @required this.calificacionImbd,
    @required this.productorSerie,
  });
}
