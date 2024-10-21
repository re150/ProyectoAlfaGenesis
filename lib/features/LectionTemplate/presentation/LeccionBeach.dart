import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyBeachImage.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';

class LeccionBeach extends StatefulWidget {
  final List<Map<String, dynamic>> materiales;
  final String titulo;
  final String instrucciones;
  final VoidCallback onNext;
  const LeccionBeach({
    super.key,
    required this.materiales,
    required this.titulo,
    required this.instrucciones,
    required this.onNext,
  });

  @override
  State<LeccionBeach> createState() => _LeccionBeachState();
}

class _LeccionBeachState extends State<LeccionBeach>
    with SingleTickerProviderStateMixin {
  final List<AudioPlayer> sonidos = [
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
  ];
  final bgMusic = AudioPlayer();
  late AnimationController _controller;
  late Animation<double> _animation;
  String instruccionesPath = "";
  String res = "";
  bool respondio = false;
  List<String> imagenes = [];

  void _checarRespuesta(String respuesta) {
    setState(() {
      respondio = true;
    });
    bool esCorrecto = false;
    if (respuesta == res) {
      esCorrecto = true;
    }
    sonidos[4].play(
        AssetSource(esCorrecto ? "successLesson.mp3" : "wrong-choice.mp3"));

    bgMusic.stop();
    Future.delayed(const Duration(milliseconds: 1500), () {
      widget.onNext();
    });
  }

  void _procesarMateriales() {
    setState(() {
      imagenes = widget.materiales
          .where((material) => material["tipo_material"] == "imagen")
          .map((material) => material["valor_material"] as String)
          .toList();
      instruccionesPath = widget.materiales
          .where((material) => material["tipo_material"] == "audio")
          .map((material) => material["valor_material"] as String)
          .first;
      instruccionesPath = instruccionesPath.replaceFirst('assets/', '');
      res = imagenes[0];
      imagenes.shuffle();
    });
  }

  void _setMusica() {
    bgMusic.setReleaseMode(ReleaseMode.loop);
    bgMusic.play(AssetSource("Beach.mp3"));
  }

  void _setAnimacion() {
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void initState() {
    super.initState();
    _procesarMateriales();
    _setMusica();
    _setAnimacion();
  }

  @override
  void dispose() {
    for (AudioPlayer sonido in sonidos) {
      sonido.dispose();
    }
    _controller.dispose();
    bgMusic.dispose();
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
              MyLectionBanner(
                titulo: widget.titulo,
                onPressed: () =>
                    sonidos[4].play(AssetSource(instruccionesPath)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    imagenes.length,
                    (index) {
                      return MyBeachImage(
                        imagen: imagenes[index],
                        onTap: () {
                          if (!respondio) _checarRespuesta(imagenes[index]);
                        },
                      );
                    },
                  ),
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
                                sonidos[3].play(AssetSource(instruccionesPath)),
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
