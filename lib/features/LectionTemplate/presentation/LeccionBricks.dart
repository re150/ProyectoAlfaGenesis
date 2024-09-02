import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/widgets/MyBrick.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:audioplayers/audioplayers.dart';

class LeccionBricks extends StatefulWidget {
  const LeccionBricks({
    super.key,
  });

  @override
  State<LeccionBricks> createState() => _LeccionBricksState();
}

class _LeccionBricksState extends State<LeccionBricks> {
  final ladrillo = AudioPlayer();
  final boton = AudioPlayer();
  final start = AudioPlayer();
  final List<String> palabras = [
    "red",
    "green",
    "blue",
  ];

  String titulo = "Titulo de leccion";
  int numTargets = 2;
  List<String> correctOrder = ['red', 'green', 'blue'];
  List<String?> draggedOrder = [null, null, null];
  Set<String> draggingPalabras = {};

  @override
  void initState() {
    super.initState();
    start.play(AssetSource("game-start.mp3"));
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
    ladrillo.dispose();
    boton.dispose();
    start.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/WallBricks.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.white.withOpacity(0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.star, color: Colors.yellow[700], size: 40),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    numTargets,
                                    (index) {
                                      final palabra = palabras[index];
                                      return Draggable<String>(
                                        data: palabra,
                                        feedback: MyBrick(texto: palabra),
                                        childWhenDragging: const SizedBox(
                                          height: 100,
                                          width: 240,
                                        ),
                                        onDragStarted: () {
                                          setState(() {
                                            draggingPalabras.add(palabra);
                                          });
                                          ladrillo
                                              .play(AssetSource("Brick.mp3"));
                                        },
                                        onDraggableCanceled: (_, __) {
                                          setState(() {
                                            draggingPalabras.remove(palabra);
                                          });
                                        },
                                        onDragEnd: (_) {
                                          setState(() {
                                            draggingPalabras.remove(palabra);
                                          });
                                        },
                                        child: draggedOrder.contains(palabra) ||
                                                draggingPalabras
                                                    .contains(palabra)
                                            ? const SizedBox(
                                                height: 100,
                                                width: 240,
                                              )
                                            : MyBrick(texto: palabra),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          numTargets,
                          (index) {
                            return DragTarget<String>(
                              onAcceptWithDetails: (receivedItem) {
                                setState(() {
                                  draggedOrder[index] = receivedItem.data;
                                });
                                ladrillo.play(AssetSource("Brick.mp3"));
                              },
                              builder: (context, candidateData, rejectedData) {
                                return Container(
                                  width: 240,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(color: Colors.orange)),
                                  child: draggedOrder[index] != null
                                      ? MyBrick(texto: draggedOrder[index]!)
                                      : Container(),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      MyButton(
                        text: "Veificar",
                        colorB: Colors.blue,
                        colorT: Colors.white,
                        onTap: () {
                          bool esCorrecto = true;
                          for (int i = 0; i < correctOrder.length; i++) {
                            if (draggedOrder[i] != correctOrder[i]) {
                              esCorrecto = false;
                              break;
                            }
                          }
                          if (esCorrecto) {
                            boton.play(AssetSource("successLesson.mp3"));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Correcto"),
                              ),
                            );
                          } else {
                            boton.play(AssetSource("wrong-choice.mp3"));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Incorrecto"),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ladrillo.play(AssetSource("Brick.mp3"));
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("assets/crab.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}