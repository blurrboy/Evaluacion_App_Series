


import 'package:app_series/providers/mis_series.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalleSerieScreen extends StatelessWidget {
  static const routeName = 'detalle_serie';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final serieSeleccionada = Provider.of<MisSeries>(context).encontrarSeriePorID(id);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(serieSeleccionada.tituloOriginal),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Text(
            serieSeleccionada.tituloTraduccion,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black
            ),
          ),
        ],
        ),
    )
  }
}