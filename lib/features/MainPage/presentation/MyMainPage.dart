import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/widgets/MyLevelButton.dart';
import 'package:proyecto/widgets/MyStarButton.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/resources/DataBaseHelper.dart';
import '../../../core/resources/constants.dart';
import '../../../core/resources/musica_fondo.dart';
import '../../../provider/AuthProvider.dart';
import '../../../provider/ProfileProvider.dart';
import '../../LectionTemplate/presentation/LeccionDemo.dart';
import 'package:http/http.dart' as http;

class MyMainPage extends StatefulWidget {
  final Map<String, dynamic> nivel;
  const MyMainPage({super.key, this.nivel = const {}});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> with WidgetsBindingObserver {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final Map<int, List<Map<String, dynamic>>> _leccionessPorNivel = {};
  List<Map<String, dynamic>> _lecciones = [];
  bool dataLoaded = false;
  int puntajeTotal = 0; //PUNTAJE TOTAL DEL USUARIO EXTRAIDO DE LA DB
  String imagenurl = "";
  List<String> imagenes = [
    "cat.png",
    "Bricks.png",
    "OceanBG.jpg",
    "pez3.jpg",
    "SkyBG.webp",
    "WallBricks.jpg",
    "crab.png"
  ];

  Future<void> _loadPuntaje() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final dataProvider = Provider.of<ProfileProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final id = dataProvider.id;
    final name = dataProvider.name;

    final response = await http.get(
      Uri.parse('http://$ipAdress:$port/next/alfa/GetPunctuation/$id/$name'),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );
    if (response.statusCode == 200) {
      setState(() {
        puntajeTotal = int.parse(response.body);
        imagenurl = dataProvider.imgUrl;
      });
    } else {
      throw Exception('Error al cargar las estrellas');
    }
  }

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
    _loadPuntaje();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
    _loadLecciones();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      MusicaFondo().continuarMusica();
    } else {
      MusicaFondo().pausarMusica();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profileEdition'),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage(imagenurl == "" ? "assets/cat.png" : imagenurl),
              maxRadius: 25,
              minRadius: 25,
            ),
          ),
          const SizedBox(width: 20),
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
                                        imagen:
                                            imagenes[index % imagenes.length],
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
