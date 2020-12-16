import 'package:app_series/helpers/db_helper.dart';
import 'package:app_series/models/serie_model.dart';
import 'package:flutter/foundation.dart';

class MisSeries extends ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  List<Serie> _items = [];

  List<Serie> get items {
    return [..._items];
  }

  Serie encontrarSeriePorID(String id) {
    return _items.firstWhere((serie) => serie.id == id);
  }

  Future<void> eliminarSerie(String id) async {
    final serieBuscada = encontrarSeriePorID(id);
    _items.remove(serieBuscada);
    notifyListeners();
    dbHelper.eliminar('mis_series', serieBuscada.id);
  }

  Future<void> traerSeries() async {
    final listaData = await dbHelper.obtenerDatos('mis_series');
    _items = listaData
        .map((item) => Serie(
            id: item['id'],
            tituloOriginal: item['tituloOriginal'],
            tituloTraduccion: item['tituloTraduccion'],
            numTemporadas: item['numTemporadas'],
            numEpisodios: item['numEpisodios'],
            calificacionImbd: item['calificacionImbd'],
            productorSerie: item['productorSerie']))
        .toList();
    notifyListeners();
  }

  Future<void> agregarSerie(
      String tituloOriginalSelec,
      String tituloTradSelec,
      int numTSelec,
      int numESelec,
      double calificacionSelec,
      String productorSelec) {
    final nuevaSerie = Serie(
        id: DateTime.now().toString(),
        tituloOriginal: tituloOriginalSelec,
        tituloTraduccion: tituloTradSelec,
        numTemporadas: numTSelec,
        numEpisodios: numESelec,
        calificacionImbd: calificacionSelec,
        productorSerie: productorSelec);
    _items.add(nuevaSerie);
    notifyListeners();
    dbHelper.insertar('misSeries', {
      'id': nuevaSerie.id,
      'tituloOriginal': nuevaSerie.tituloOriginal,
      'tituloTraduccion': nuevaSerie.tituloTraduccion,
      'numTemporadas': nuevaSerie.numTemporadas,
      'numEpisodios': nuevaSerie.numEpisodios,
      'calificacionImbd': nuevaSerie.calificacionImbd,
      'productorSerie': nuevaSerie.productorSerie
    });
  }
}
