import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/DataBaseHelper.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/core/resources/musica_fondo.dart';
import 'package:proyecto/features/MainPage/presentation/MyMainPage.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import '../../../widgets/MyRoadMapButton.dart';
import '../../../widgets/MyStarButton.dart';
import 'package:http/http.dart' as http;

class MyRoadMapView extends StatefulWidget {
  const MyRoadMapView({super.key});

  @override
  State<MyRoadMapView> createState() => _MyRoadMapViewState();
}

class _MyRoadMapViewState extends State<MyRoadMapView>
    with WidgetsBindingObserver {
  late int puntaje;
  List<Map<String, dynamic>> _niveles = [];
  bool dataLoaded = false;
  List<String> imagenes = [
    "crab.png",
    "Bricks.png",
    "OceanBG.jpg",
    "pez3.jpg",
    "SkyBG.webp",
    "WallBricks.jpg",
    "crab.png"
  ];
  int puntajeTotal = 0; //PUNTAJE TOTAL DEL USUARIO EXTRAIDO DE LA DB
  String imagenurl = "";

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

  void _onPop() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('¿Desea salir?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  MusicaFondo().detenerMusica();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Salir'),
              ),
            ],
          );
        });
  }

  void _onPressed(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyMainPage(
          nivel: _niveles[index],
        ),
      ),
    );
  }

  Future<void> _loadNiveles() async {
    final dbHelper = DatabaseHelper();
    final niveles = await dbHelper.getNiveles();
    setState(() {
      _niveles = niveles;
      dataLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    MusicaFondo().playMusica("Music/MainViewBG.mp3");
    _loadNiveles();
    _loadPuntaje();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      MusicaFondo().continuarMusica();
    } else if (state == AppLifecycleState.paused) {
      MusicaFondo().pausarMusica();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!dataLoaded) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Elegir Nivel', style: TextStyle(fontSize: 30)),
          backgroundColor: Colors.white,
          centerTitle: true,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.red,
            iconSize: 50,
            onPressed: () => _onPop(),
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
        body: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 3,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 9,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.green, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Mundo ${index + 1}',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _niveles.length,
                        separatorBuilder: (context, index) {
                          return Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              height: 5,
                              color: Colors.black,
                            ),
                          );
                        },
                        itemBuilder: (context, horizontalIndex) {
                          bool lock = index > 0;
                          return MyRoadmapButton(
                            isLocked: lock,
                            onPressed: () => _onPressed(horizontalIndex),
                            titulo: lock
                                ? "BLOQUEADO"
                                : _niveles[horizontalIndex]['nombre'],
                            puntaje: 5,
                            imagen: lock
                                ? "assets/cat.png"
                                : "assets/${imagenes[horizontalIndex % imagenes.length]}",
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
