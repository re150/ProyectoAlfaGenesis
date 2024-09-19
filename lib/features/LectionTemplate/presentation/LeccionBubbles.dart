import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widgets/MyBubble.dart';
import '../../../widgets/MyLectionBanner.dart';

class LeccionBubbles extends StatefulWidget {
  const LeccionBubbles({super.key});

  @override
  State<LeccionBubbles> createState() => _LeccionBubblesState();
}

class _LeccionBubblesState extends State<LeccionBubbles>
    with TickerProviderStateMixin {
  final List<String> letras = ["A", "B", "C", "D", "E"];
  final AudioPlayer bgMusic = AudioPlayer();
  final AudioPlayer boton = AudioPlayer();
  AnimationController? _controller;
  List<Animation<Offset>>? _animaciones;
  final String titulo = "Titulo de leccion";

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
                      child: MyBubble(
                        onTap: () {
                          boton.play(AssetSource("BubblePop.mp3"));
                        },
                        letra: letras[0],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SlideTransition(
                      position: _animaciones![1],
                      child: MyBubble(
                        onTap: () {
                           boton.play(AssetSource("BubblePop.mp3"));
                        },
                        letra: letras[1],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SlideTransition(
                      position: _animaciones![2],
                      child: MyBubble(
                        onTap: () {
                           boton.play(AssetSource("BubblePop.mp3"));
                        },
                        letra: letras[2],
                      ),
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
                      child: MyBubble(
                        onTap: () {
                           boton.play(AssetSource("BubblePop.mp3"));
                        },
                        letra: letras[3],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SlideTransition(
                      position: _animaciones![4],
                      child: MyBubble(
                        onTap: () {
                           boton.play(AssetSource("BubblePop.mp3"));
                        },
                        letra: letras[4],
                      ),
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
