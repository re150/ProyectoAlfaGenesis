import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/widgets/MyBeachImage.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';

class LeccionBeach extends StatefulWidget {
  const LeccionBeach({super.key});

  @override
  State<LeccionBeach> createState() => _LeccionBeachState();
}

class _LeccionBeachState extends State<LeccionBeach>
    with SingleTickerProviderStateMixin {
  final boton1 = AudioPlayer();
  final boton2 = AudioPlayer();
  final boton3 = AudioPlayer();
  late AnimationController _controller;
  late Animation<double> _animation;

  String titulo = "Titulo de leccion";
  List<String> imagenes = [
    "assets/bee-kid.png",
    "assets/bubble.png",
    "assets/cat.png",
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

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
    _controller.dispose();
    boton1.dispose();
    boton2.dispose();
    boton3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/BeachBG.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              MyLectionBanner(titulo: titulo),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyBeachImage(
                      ruta: imagenes[0],
                      onTap: () => boton1.play(AssetSource("game-start.mp3")),
                    ),
                    MyBeachImage(
                      ruta: imagenes[1],
                      onTap: () => boton2.play(AssetSource("game-start.mp3")),
                    ),
                    MyBeachImage(
                      ruta: imagenes[2],
                      onTap: () => boton3.play(AssetSource("game-start.mp3")),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                              _animation.value *
                                      MediaQuery.of(context).size.width -
                                  100,
                              0),
                          child: InkWell(
                            onTap: () =>
                                boton1.play(AssetSource("game-start.mp3")),
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/crab.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
