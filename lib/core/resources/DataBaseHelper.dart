import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      print(_database);
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'AlfaGenesisDB.db');

    return _database == null ? await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        
        await db.execute('''
          CREATE TABLE lecciones(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE etapa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            id_leccion INTEGER,
            leccion_tipo TEXT,
            instrucciones TEXT,
            musica_fondo TEXT,
            FOREIGN KEY (id_leccion) REFERENCES Lecciones(id)
          )
        ''');
        //TOODO: CHECAR LAS ROWS EN LAS TABLAS

        await db.execute('''
          CREATE TABLE material(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            id_etapa INTEGER,
            tipo_material TEXT,
            valor_material TEXT,
            FOREIGN KEY (id_etapa) REFERENCES Etapa(id)
          )
        ''');

        await _cargarDatos(db);
      },
    ) : _database!;
  }

  Future<void> _cargarDatos(Database db) async {
    String dataSQL = await rootBundle.loadString('assets/data.sql');
    List<String> queries = dataSQL.split(';');
    for (String query in queries) {
      if (query.trim().isNotEmpty) {
        await db.execute(query);
       }
     }
  }

  Future<List<Map<String, dynamic>>> getLecciones() async {
    final db = await database;
    return await db.query('Lecciones');
  }

  Future<List<Map<String, dynamic>>> getEtapa(int idLeccion) async {
    final db = await database;
    return await db.query('Etapa', where: 'id_leccion = ?', whereArgs: [idLeccion]);
  }

  Future<List<Map<String, dynamic>>> getMaterial(int idEtapa) async {
    final db = await database;
    return await db.query('Material', where: 'id_etapa = ?', whereArgs: [idEtapa]);
  }
}
