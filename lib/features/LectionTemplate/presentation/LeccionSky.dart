import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';
import 'package:proyecto/widgets/MySkyBlock.dart';

class LeccionSky extends StatefulWidget {
  const LeccionSky({super.key});

  @override
  State<LeccionSky> createState() => _LeccionSkyState();
}

class _LeccionSkyState extends State<LeccionSky> {
  final String titulo = "Titulo de leccion";
  final bgMusic = AudioPlayer();
  final nuve = AudioPlayer();
  final respuesta = AudioPlayer();
  int? selectedIndexPalabras;
  int? selectedIndexImagenes;

  Map<int, String> imagenes = {
    1: "assets/OceanBG.jpg",
    2: "assets/bee-kid.png",
    3: "assets/logoo.png",
  };

  Map<int, String> palabras = {
    1: "CASA",
    2: "CIELO",
    3: "LUNA",
    4: "CAMA",
    5: "PERRO",
    6: "GATA",
  };

  Map<K, V> shuffleMap<K, V>(Map<K, V> map) {
    List<MapEntry<K, V>> entries = map.entries.toList();
    entries.shuffle();
    return Map<K, V>.fromEntries(entries);
  }

  void _onTapSkyBlockPalabras(int index) {
    nuve.play(AssetSource("SelectButton.mp3"));
    setState(() {
      selectedIndexPalabras = index;
    });
  }

  void _onTapSkyBlockImagenes(int index) {
    nuve.play(AssetSource("SelectButton.mp3"));
    setState(() {
      selectedIndexImagenes = index;
    });
  }

  void _checarRespuesta(int indexP, int indexI) {
    if (indexP == indexI) {
      respuesta.play(AssetSource("successLesson.mp3"));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Correcto"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      respuesta.play(AssetSource("wrong-choice.mp3"));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Incorrecto"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    bgMusic.setReleaseMode(ReleaseMode.loop);
    bgMusic.play(AssetSource("Sky2.mp3"));
    palabras = shuffleMap(palabras);
    imagenes = shuffleMap(imagenes);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
    bgMusic.dispose();
    nuve.dispose();
    respuesta.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/SkyBG.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                MyLectionBanner(
                  titulo: titulo,
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: palabras.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MySkyblock(
                                  isSelected: selectedIndexPalabras == index,
                                  onTap: () => _onTapSkyBlockPalabras(index),
                                  content: Center(
                                    child: Text(
                                      palabras.values.elementAt(index),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(
                                text: "Verificar",
                                onTap: () => _checarRespuesta(
                                    palabras.keys
                                        .elementAt(selectedIndexPalabras!),
                                    imagenes.keys
                                        .elementAt(selectedIndexImagenes!)),
                                colorB: Colors.blue,
                                colorT: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: imagenes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MySkyblock(
                            content: Image.asset(
                              imagenes.values.elementAt(index),
                              width: 100,
                              height: 100,
                            ),
                            isSelected: selectedIndexImagenes == index,
                            onTap: () => _onTapSkyBlockImagenes(index),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
