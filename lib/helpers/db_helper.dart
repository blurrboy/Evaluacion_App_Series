import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database db;
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'series.db');
    db = await openDatabase(path, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE mis_series(id TEXT PRIMARY KEY, tituloOriginal TEXT, tituloTraduccion TEXT, numTemporadas INTEGER, numEpisodios INTEGER, calificacionImbd REAL, productorSerie TEXT)');
    }, version: 1);
    return db;
  }

  Future<void> insertar(String tabla, Map<String, Object> data) async{
    final db = await initDB();
    db.insert(
      tabla,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace
      );
  }

  Future<List<Map<String,dynamic>>> obtenerDatos(String tabla)async{
    final db = await initDB();
    return db.query(tabla);

  }

  Future<void> eliminar(String tabla, String id)async{
    final db = await initDB();
    db.delete(tabla, where: 'id = ?', whereArgs: [id]);
  }
}
