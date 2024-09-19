import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';
import 'package:proyecto/widgets/MyLinePainter.dart';

class LeccionSky extends StatefulWidget {
  const LeccionSky({super.key});

  @override
  State<LeccionSky> createState() => _LeccionSkyState();
}

class _LeccionSkyState extends State<LeccionSky> {
  final String titulo = "Titulo de leccion";
  final bgMusic = AudioPlayer();

  final List<String> imagenes = [
    "assets/OceanBG.jpg",
    "assets/bee-kid.png",
    "assets/logoo.png",
  ];

  final List<String> palabras = [
    "CASA",
    "CIELO",
    "LUNA",
    "CASA",
    "CIELO",
    "LUNA",
    "CASA",
    "CIELO",
    "LUNA",
    "CASA",
    "CIELO",
    "LUNA",
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    bgMusic.setReleaseMode(ReleaseMode.loop);
    bgMusic.play(AssetSource("Sky2.mp3"));
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
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: palabras.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  palabras[index],
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: Column()),
                  Expanded(
                    child: ListView.builder(
                      itemCount: imagenes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            imagenes[index],
                            width: 100,
                            height: 100,
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

/* final List<String> imagenes = [
    "assets/OceanBG.jpg",
    "assets/bee-kid.png",
    "assets/logoo.png",
  ]; 
  
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/SkyBG.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    MyLectionBanner(
                      titulo: titulo,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            palabras.length,
                            (index) {
                              return GestureDetector(
                                onPanStart: (details) {
                                  setState(() {
                                    start = _getLocalPosition(context, details.globalPosition);
                                    end = _getLocalPosition(context, details.globalPosition);
                                    drawingLine = true;
                                    draggedWord = palabras[index];
                                  });
                                },
                                onPanUpdate: (details) {
                                  setState(() {
                                    end = _getLocalPosition(context, details.globalPosition);
                                  });
                                },
                                onPanEnd: (details) {
                                  setState(() {
                                    drawingLine = false;
                                    start = Offset.zero;
                                    end = Offset.zero;
                                    draggedWord = null;
                                  });
                                },
                                child: Text(
                                  palabras[index],
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            imagenes.length,
                            (index) {
                              return DragTarget<String>(
                                onWillAccept: (data) {
                                  return data != null;
                                },
                                onAccept: (data) {
                                  print("Emparejado: $data con imagen ${imagenes[index]}");
                                  setState(() {
                                    drawingLine = false;
                                    start = Offset.zero;
                                    end = Offset.zero;
                                    draggedWord = null;
                                  });
                                },
                                builder: (context, candidateData, rejectedData) {
                                  return Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                        image: AssetImage(imagenes[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
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
            if (drawingLine)
              CustomPaint(
                painter: LinePainter(start: start, end: end),
                child: Container(),
              ),
          ],
        ),
      ),
  
  
  
  */