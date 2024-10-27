import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/core/resources/DataBaseHelper.dart';
import '../../../widgets/MyRoadMapButton.dart';

class MyRoadMapView extends StatefulWidget {
  const MyRoadMapView({super.key});

  @override
  State<MyRoadMapView> createState() => _MyRoadMapViewState();
}

class _MyRoadMapViewState extends State<MyRoadMapView> {
  late int puntaje;

  void _onPressed() {
    Navigator.pushNamed(context, '/MainPage');
  }

  Future<void> _loadLecciones() async {
    final dbHelper = DatabaseHelper();
    //final lecciones = await dbHelper.getLecciones();
    setState(() {
      //TODO
    });
  }

  @override
  void initState() {
    super.initState();
    _loadLecciones();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.manage_accounts),
              color: Colors.blue,
              iconSize: 50,
              onPressed: () {
                Navigator.pushNamed(context, '/profileEdition');
              },
            ),
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
                        itemCount: 5,
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
                          return MyRoadmapButton(
                            isLocked: (horizontalIndex+1)>1,
                            onPressed: _onPressed,
                            titulo: '${horizontalIndex + 1}',
                            puntaje: horizontalIndex + 1,
                            imagen: 'assets/cat.png',
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
