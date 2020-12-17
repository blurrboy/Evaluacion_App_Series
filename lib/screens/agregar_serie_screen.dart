import 'package:app_series/providers/mis_series.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgregarSerieScreen extends StatefulWidget {
  static const routeName = 'agregar_serie';
  @override
  _AgregarSerieScreenState createState() => _AgregarSerieScreenState();
}

class _AgregarSerieScreenState extends State<AgregarSerieScreen> {
  final tituloOriginalController = TextEditingController();
  final tituloTraducidoController = TextEditingController();
  final numTemporadasController = TextEditingController();
  final numEpisodiosController = TextEditingController();
  final calificacionImbdController = TextEditingController();
  final productorSerieController = TextEditingController();

  void guardarSerie() {
    int numTemp = int.parse(numTemporadasController.text);
    int numEpis = int.parse(numEpisodiosController.text);
    double califiImbd = double.parse(calificacionImbdController.text);

    if (tituloOriginalController.text.isEmpty ||
        tituloTraducidoController.text.isEmpty ||
        numTemporadasController.text.isEmpty ||
        numEpisodiosController.text.isEmpty ||
        calificacionImbdController.text.isEmpty ||
        productorSerieController.text.isEmpty) {
      return;
    }
    Provider.of<MisSeries>(context, listen: false).agregarSerie(
        tituloOriginalController.text,
        tituloTraducidoController.text,
        numTemp,
        numEpis,
        califiImbd,
        productorSerieController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Añadir Series'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration:
                          InputDecoration(labelText: ' Título Original'),
                      controller: tituloOriginalController,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ' Título Traducido'),
                      controller: tituloTraducidoController,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ' Número de Temporadas'),
                      controller: numTemporadasController,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ' Número de Episodios'),
                      controller: numEpisodiosController,
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: ' Calificación Imdb'),
                      controller: calificacionImbdController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: ' Productor'),
                      controller: productorSerieController,
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton.icon(
              icon: Icon(Icons.add),
              onPressed: guardarSerie,
              label: Text('Agregar Serie'),
              color: Theme.of(context).accentColor,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            )
          ],
        ));
  }
}
