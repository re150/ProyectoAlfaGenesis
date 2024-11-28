import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/DataBaseHelper.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/core/resources/musica_fondo.dart';
import 'package:proyecto/features/MainPage/presentation/MyMainPage.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import 'package:proyecto/provider/TeamProvider.dart';
import '../../../main.dart';
import '../../../widgets/MyRoadMapButton.dart';
import '../../../widgets/MyStarButton.dart';
import 'package:http/http.dart' as http;

class MyRoadMapView extends StatefulWidget {
  const MyRoadMapView({super.key});

  @override
  State<MyRoadMapView> createState() => _MyRoadMapViewState();
}

class _MyRoadMapViewState extends State<MyRoadMapView>
    with WidgetsBindingObserver, RouteAware {
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
      Uri.parse('$address/next/alfa/GetPunctuation/$id/$name'),
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void didPopNext() {
    _loadPuntaje();
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: CircularProgressIndicator()),
            Center(
                child: Text(
              'Cargando...',
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      );
    }
    TeamProvider teamProvider = Provider.of<TeamProvider>(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mapa', style: TextStyle(fontSize: 30)),
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          scrolledUnderElevation: 0,
          leading: Container(
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 40,
              onPressed: _onPop,
            ),
          ),
          actions: [
            teamProvider.idTeam.isEmpty
                ? const MyStar(correcto: true)
                : const SizedBox(),
            teamProvider.idTeam.isEmpty
                ? Text(
                    'x$puntajeTotal',
                    style: const TextStyle(fontSize: 20),
                  )
                : const SizedBox(),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => teamProvider.idTeam.isEmpty
                  ? Navigator.pushNamed(context, '/ProfileEdition2')
                  : null,
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
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/BeachBG.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 3,
                  color: Colors.black,
                ),
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
                              colors: [
                                Colors.blue,
                                Colors.green,
                                Colors.yellow
                              ],
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
          ],
        ),
      ),
    );
  }
}