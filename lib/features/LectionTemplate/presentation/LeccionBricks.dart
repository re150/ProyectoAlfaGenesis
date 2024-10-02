import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/widgets/MyBrick.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';

class LeccionBricks extends StatefulWidget {
  final List<Map<String, dynamic>> materiales;
  final String titulo;
  final VoidCallback onNext;
  final String instrucciones;

  const LeccionBricks({
    super.key,
    required this.materiales,
    required this.titulo,
    required this.onNext,
    required this.instrucciones,
  });

  @override
  State<LeccionBricks> createState() => _LeccionBricksState();
}

class _LeccionBricksState extends State<LeccionBricks> {
  final boton = AudioPlayer();
  final start = AudioPlayer();
  final instruccriones = AudioPlayer();
  final pista = AudioPlayer();
  final bgMusic = AudioPlayer();
  String imgPath = "";
  String instruccionesPath = "";
  String pistaPath = "";
  List<String> palabras = [];
  List<AudioPlayer> ladrillos = [];
  int numTargets = 0;
  List<String> correctOrder = [];
  List<String?> draggedOrder = [];
  Set<String> draggingPalabras = {};
  bool isDragging = false;

  void _procesarMateriales() {
    setState(() {
      palabras = widget.materiales
          .where((material) => material["tipo_material"] == "palabra")
          .map((material) => material["valor_material"] as String)
          .toList();

      correctOrder = List.from(palabras);
      numTargets = palabras.length;
      palabras.shuffle();
      draggedOrder = List<String?>.filled(numTargets, null);

      imgPath = widget.materiales.firstWhere((material) =>
          material["tipo_material"] == "imagen")["valor_material"] as String;
      pistaPath = widget.materiales.firstWhere((material) =>
          material["tipo_material"] == "audio")["valor_material"] as String;

      pistaPath = pistaPath.replaceFirst('assets/', '');
      instruccionesPath = widget.instrucciones;
      instruccionesPath = instruccionesPath.replaceFirst('assets/', '');

      ladrillos = List.generate(palabras.length, (_) => AudioPlayer());
    });
  }

  void _setAudio() {
    bgMusic.setVolume(0.4);
    bgMusic.setReleaseMode(ReleaseMode.loop);
    start.play(AssetSource("game-start.mp3"));
    bgMusic.play(AssetSource("Blocks.mp3"));
  }

  void _checarRespuesta() {
    bool esCorrecto = true;
    for (int i = 0; i < correctOrder.length; i++) {
      if (draggedOrder[i] != correctOrder[i]) {
        esCorrecto = false;
        break;
      }
    }
    String mensaje = esCorrecto ? "Correcto" : "Incorrecto";
    boton.play(
        AssetSource(esCorrecto ? "successLesson.mp3" : "wrong-choice.mp3"));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(mensaje))); //REEMPLAZAR SNACKBAR POR LA DEBIDA IMPLEMENTACION
    bgMusic.stop();
    Future.delayed(const Duration(milliseconds: 1500), () {
      widget.onNext();
    });
  }

  @override
  void initState() {
    super.initState();
    _procesarMateriales();
    _setAudio();
  }

  @override
  void dispose() {
    for (AudioPlayer ladrillo in ladrillos) {
      ladrillo.dispose();
    }
    boton.dispose();
    start.dispose();
    bgMusic.dispose();
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
          MyLectionBanner(
            titulo: widget.titulo,
            onPressed: () =>
                instruccriones.play(AssetSource(instruccionesPath)),
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
                                            isDragging = true;
                                          });
                                          ladrillos[index]
                                              .play(AssetSource("Brick.mp3"));
                                        },
                                        onDraggableCanceled: (_, __) {
                                          setState(() {
                                            draggingPalabras.remove(palabra);
                                            isDragging = false;
                                          });
                                        },
                                        onDragEnd: (_) {
                                          setState(() {
                                            draggingPalabras.remove(palabra);
                                            isDragging = false;
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
                                  isDragging = false;
                                });
                                ladrillos[index].play(AssetSource("Brick.mp3"));
                              },
                              builder: (context, candidateData, rejectedData) {
                                return Container(
                                  width: 240,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.orange),
                                  ),
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
                        text: "Verificar",
                        colorB: Colors.blue,
                        colorT: Colors.white,
                        onTap: _checarRespuesta,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (!isDragging) {
                      pista.play(AssetSource(pistaPath));
                    }
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imgPath),
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
