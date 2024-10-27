import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/widgets/MyLevelButton.dart';
import 'package:proyecto/widgets/MyStarButton.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/resources/DataBaseHelper.dart';
import '../../LectionTemplate/presentation/LeccionDemo.dart';

class MyMainPage extends StatefulWidget {
  final Map<String, dynamic> nivel;
  const MyMainPage({super.key, this.nivel = const {}});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final Map<int, List<Map<String, dynamic>>> _leccionessPorNivel = {};
  List<Map<String, dynamic>> _lecciones = [];
  bool dataLoaded = false;
  int puntajeTotal = 100; //PUNTAJE TOTAL DEL USUARIO EXTRAIDO DE LA DB
  List<String> imagenes = ["cat.png", "Bricks.png", "OceanBG.jpg", "pez3.jpg", "SkyBG.webp", "WallBricks.jpg", "crab.png"];

  Future<void> _loadLecciones() async {
    final Database db = await _dbHelper.database;
    int nivelId = widget.nivel['id'];
    _lecciones = await db.query(
      'lecciones',
      where: 'id_nivel = ?',
      whereArgs: [nivelId],
    );

    for (var leccion in _lecciones) {
      int leccionId = leccion['id'];
      List<Map<String, dynamic>> etapas = await db.query(
        'etapa',
        where: 'id_leccion = ?',
        whereArgs: [leccionId],
      );
      _leccionessPorNivel[leccionId] = etapas;
    }
    setState(() {
      dataLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _loadLecciones();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!dataLoaded) {
      return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.blue,
              ),
            ),
            Center(
              child: Text(
                'Cargando...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elegir Lección', style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.red,
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          const MyStar(correcto: true), 

          Text(
            'x$puntajeTotal',
            style: const TextStyle(fontSize: 20),
          ),

          IconButton(
            icon: const Icon(Icons.person),
            color: Colors.blue,
            iconSize: 50,
            onPressed: () {
              Navigator.pushNamed(context, '/GroupCreationPage');
            },
          ),
        ],
      ),
      body: _lecciones.isNotEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 150,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.all(20),
                                  itemCount: _lecciones.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: MyLevelButton(
                                        nivel: _lecciones[index]['titulo'],
                                        puntaje: index + 1 <= 5 ? index + 1 : 0,
                                        imagen: imagenes[index%imagenes.length],
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LeccionDemo(
                                                leccion: _lecciones[index],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: Text('ERROR: No hay lecciones disponibles'),
            ),
    );
  }
}
