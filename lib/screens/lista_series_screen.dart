import 'package:app_series/providers/mis_series.dart';
import 'package:app_series/screens/agregar_serie_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detalle_serie_screen.dart';

class ListaSeriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Series'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AgregarSerieScreen.routeName);
              })
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<MisSeries>(context, listen: false).traerSeries(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<MisSeries>(
                child: Center(
                  child: Text('No hay Series, Agregalas'),
                ),
                builder: (context, misSeries, ch) => misSeries.items.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: misSeries.items.length,
                        itemBuilder: (context, i) => Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              Provider.of<MisSeries>(context, listen: false)
                                  .eliminarSerie(misSeries.items[i].id);
                            },
                            background: Container(
                              child: Center(
                                child: Text(
                                  'ELIMINAR',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              color: Colors.red,
                            ),
                            child: ListTile(
                              title: Text(misSeries.items[i].tituloOriginal),
                              subtitle:
                                  Text(misSeries.items[i].tituloTraduccion),
                              onTap: () => Navigator.of(context).pushNamed(
                                  DetalleSerieScreen.routeName,
                                  arguments: misSeries.items[i].id),
                            )))),
      ),
    );
  }
}
