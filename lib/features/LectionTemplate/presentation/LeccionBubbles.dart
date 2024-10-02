import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../widgets/MyBubble.dart';
import '../../../widgets/MyLectionBanner.dart';

/// Esta vista se encarga de la leccion correspondiente a la de burbujas
///
/// Hola

class LeccionBubbles extends StatefulWidget {
  const LeccionBubbles({super.key});

  @override
  State<LeccionBubbles> createState() => _LeccionBubblesState();
}

class _LeccionBubblesState extends State<LeccionBubbles>
    with TickerProviderStateMixin {

  final List<String> letras = ["A", "B", "C", "D", "E"];
  final respuesta = "A";
  final bgMusic = AudioPlayer();
  final boton = AudioPlayer();
  final res = AudioPlayer();
  final String titulo = "Titulo de leccion";
  AnimationController? _controller;
  List<Animation<Offset>>? _animaciones;
  List<bool> popped = [false, false, false, false, false];


  void _checarRespuesta(String letra, int index) {

    setState(() {
      popped[index] = true;
    });
    if (letra == respuesta) {
      res.play(AssetSource("successLesson.mp3"));
      
    } else {
      res.play(AssetSource("wrong-choice.mp3"));
    }
  }

  @override
  void initState() {
    super.initState();
    //comentarios de separación para no perderme

    //orientacion de la tableta
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    //musica
    bgMusic.play(AssetSource("WaterLesson.mp3"));
    bgMusic.setReleaseMode(ReleaseMode.loop);

    //animacion
    _animaciones = List.generate(5, (index) {
      final controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      );
      Future.delayed(Duration(milliseconds: index * 500), () {
        controller.repeat(reverse: true);
      });
      return Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, -0.1),
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));
    });

    _animaciones!.shuffle();
    letras.shuffle();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
    _controller?.dispose();
    bgMusic.dispose();
    boton.dispose();
    res.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/OceanBG.jpg"), fit: BoxFit.cover),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SlideTransition(
                      position: _animaciones![0],
                      child: !popped[0] ? MyBubble(
                        onTap: () {
                          boton.play(AssetSource("BubblePop.mp3"));
                          _checarRespuesta(letras[0], 0);
                        },
                        letra: letras[0],
                      ) : Container()
                    ),
                  ],
                ),
                Column(
                  children: [
                    SlideTransition(
                      position: _animaciones![1],
                      child: !popped[1] ? MyBubble(
                        onTap: () {
                          boton.play(AssetSource("BubblePop.mp3"));
                          _checarRespuesta(letras[1], 1);
                        },
                        letra: letras[1],
                      ) : const SizedBox()
                    ),
                  ],
                ),
                Column(
                  children: [
                    SlideTransition(
                      position: _animaciones![2],
                      child: !popped[2] ? MyBubble(
                        onTap: () {
                          boton.play(AssetSource("BubblePop.mp3"));
                          _checarRespuesta(letras[2], 2);
                        },
                        letra: letras[2],
                      ) : const SizedBox()
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SlideTransition(
                      position: _animaciones![3],
                      child: !popped[3] ? MyBubble(
                        onTap: () {
                          boton.play(AssetSource("BubblePop.mp3"));
                          _checarRespuesta(letras[3], 3);
                        },
                        letra: letras[3],
                      ) : const SizedBox()
                    ),
                  ],
                ),
                Column(
                  children: [
                    SlideTransition(
                      position: _animaciones![4],
                      child: !popped[4] ? MyBubble(
                        onTap: () {
                          boton.play(AssetSource("BubblePop.mp3"));
                          _checarRespuesta(letras[4], 4);
                        },
                        letra: letras[4],
                      ) : const SizedBox()
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
