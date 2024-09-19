import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'AlfaGenesisDB.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        
        await db.execute('''
          CREATE TABLE Lecciones(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT,
          )
        ''');

        await db.execute('''
          CREATE TABLE Etapas(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            id_leccion INTEGER,
            leccion_tipo TEXT,
            instrucciones TEXT,
            musica_fondo TEXT,
            FOREIGN KEY (id_leccion) REFERENCES Lecciones(id)
          )
        ''');

//TODO: CHECAR LAS ROWS PARA LAS PALABRAS Y AUDIOS EN LAS TABLAS

        await db.execute('''
          CREATE TABLE Materiales(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            id_etapa INTEGER,
            texto TEXT,
            audio_texto TEXT,
            url_imagen TEXT,
            url_imagen2 TEXT,
            url_imagen3 TEXT,
            FOREIGN KEY (id_etapa) REFERENCES Etapas(id)
          )
        ''');

        await _cargarDatos();
      },
    );
  }

  Future<void> _cargarDatos() async {
    //aqui se cargan los datos que teniamos en el JSON
    final db = await database;

    int idLeccion = await db.insert('Lecciones', {'titulo': 'Titulo de leccion'});

    List<Map<String, dynamic>> etapas = [
      {'materials': {}},
      {'materials': {}},
      {'materials': {}},
    ];

    for (var etapa in etapas) {
      int idEtapa = await db.insert(
        'Etapas',
        {
          'id_leccion': idLeccion,
          'leccion_tipo': 'tipo',
          'instrucciones': 'instrucciones',
          'musica_fondo': 'musica_fondo'
        },
      );

      Map<String, dynamic> materials = etapa['materials'];

      await db.insert(
        'Materiales',
        {
          'id_etapa': idEtapa,
          'texto': materials['texto'],
          'audio_texto': materials['audio_texto'],
          'url_imagen': materials['url_imagen'],
          'url_imagen2': materials['url_imagen2'],
          'url_imagen3': materials['url_imagen3'],
        },
      );
    }
  }
}
