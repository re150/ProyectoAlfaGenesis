import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionBeach.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionBricks.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionBubbles.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionSky.dart';
import 'package:proyecto/widgets/MyLevelButton.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  final Map<String, dynamic> _niveles = {
    "Ladrillos": const LeccionBricks(),
    "Burbujas": const LeccionBubbles(),
    "Playa": const LeccionBeach(),
    "Cielo": const LeccionSky(),
  };

  @override
  void initState() {
    super.initState();
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
      DeviceOrientation.landscapeLeft
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elegir Nivel', style: TextStyle(fontSize: 30)),
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
          IconButton(
            icon: const Icon(Icons.person),
            color: Colors.blue,
            iconSize: 50,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
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
                            itemCount: _niveles.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyLevelButton(
                                  nivel: _niveles.keys.elementAt(index),
                                  onTap: () {
                                    Navigator.pushNamed(context, '/leccion',
                                        arguments: _niveles[_niveles.keys
                                            .elementAt(index)] as Widget);
                                  },
                                  color: Colors.primaries[
                                      index % Colors.primaries.length],
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
      ),
    );
  }
}