import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/checador_respuestas.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import 'package:proyecto/provider/TeamProvider.dart';
import 'package:proyecto/widgets/MyBrick.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class _LeccionBricksState extends State<LeccionBricks>
    with WidgetsBindingObserver {
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

  Future<void> _updatePuntaje() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final dataProvider = Provider.of<ProfileProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final id = dataProvider.id;
    final name = dataProvider.name;
    final temaProvider = Provider.of<TeamProvider>(context, listen: false);
    String url = "";

    if (temaProvider.idTeam.isEmpty) {
      url = "/Punctuation";
    } else {
      url = "/teams/PunctuationTeam";
    }

    Map<String, dynamic> body;
    if (temaProvider.idTeam.isEmpty) {
      body = {
        "id": id,
        "name": name,
        "stars": 1,
      };
    } else {
      body = {
        "id": temaProvider.idTeam,
        "stars": 1,
      };
    }
    final response = await http.patch(Uri.parse('$address/next/alfa' + url),
        headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
        body: jsonEncode(body));
    if (response.statusCode == 200) {
    } else {
      throw Exception('Error al actualizar las estrellas');
    }
  }

  void _checarRespuesta() async {
    if (draggedOrder.length != correctOrder.length ||
        draggedOrder.contains(null)) return;
    bool esCorrecto = true;

    for (int i = 0; i < correctOrder.length; i++) {
      if (draggedOrder[i] != correctOrder[i]) {
        esCorrecto = false;
        break;
      }
    }

    boton.play(
        AssetSource(esCorrecto ? "successLesson.mp3" : "wrong-choice.mp3"));
    esCorrecto ? _updatePuntaje() : null;
    final checar = Checador();
    bgMusic.stop();
    await checar.checarRespuesta(context, esCorrecto);
    widget.onNext();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _procesarMateriales();
    _setAudio();
    Future.delayed(const Duration(milliseconds: 500), () {
      pista.play(AssetSource(pistaPath));
    });
  }

  @override
  void dispose() {
    for (AudioPlayer ladrillo in ladrillos) {
      ladrillo.dispose();
    }
    boton.dispose();
    start.dispose();
    bgMusic.dispose();
    instruccriones.dispose();
    pista.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      bgMusic.resume();
    } else if (state == AppLifecycleState.paused) {
      bgMusic.pause();
    }
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
                      GestureDetector(
                        onTap: _checarRespuesta,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration:const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/Brick.jpg"), fit: BoxFit.contain),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 50,
                            color: Colors.white,
                          ),
                        )
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
                        fit: BoxFit.contain,
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
