import 'package:app_series/providers/mis_series.dart';
import 'package:app_series/screens/agregar_serie_screen.dart';
import 'package:app_series/screens/detalle_serie_screen.dart';
import 'package:app_series/screens/lista_series_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MisSeries(),
      child: MaterialApp(
        title: 'Mis Series',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo, 
          accentColor: Colors.amber
        ),
        home: ListaSeriesScreen(),
        routes: {
          AgregarSerieScreen.routeName: (context) => AgregarSerieScreen()
          DetalleSerieScreen.routeName: (context) => DetalleSerieScreen()
      ),
    );
  }
}
