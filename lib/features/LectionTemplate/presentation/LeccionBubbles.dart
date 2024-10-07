import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../widgets/MyBubble.dart';
import '../../../widgets/MyLectionBanner.dart';

/// Esta vista se encarga de la leccion correspondiente a la de burbujas
///
/// Hola

class LeccionBubbles extends StatefulWidget {
  //final List<Map<String, dynamic>> materiales;
  final String titulo;
  final VoidCallback onNext;
  final String instrucciones;

  const LeccionBubbles({
    super.key,
    //required this.materiales,
    required this.titulo,
    required this.onNext,
    required this.instrucciones,
  });

  @override
  State<LeccionBubbles> createState() => _LeccionBubblesState();
}

class _LeccionBubblesState extends State<LeccionBubbles>
    with TickerProviderStateMixin {
  final List<String> letras = ["RRO", "B", "C", "D", "E"];
  final bgMusic = AudioPlayer();
  final boton = AudioPlayer();
  final res = AudioPlayer();
  final instrucciones = AudioPlayer();
  String instruccionesPath = "";
  String respuesta = "";
  AnimationController? _controller;
  List<Animation<Offset>>? _animaciones;
  List<bool> popped = [false, false, false, false, false];
  bool pop = false;

  void _checarRespuesta(String letra, int index) {
    boton.play(AssetSource("BubblePop.mp3"));
    setState(() {
      pop = true;
      popped[index] = true;
    });
    if (letra == respuesta) {
      res.play(AssetSource("successLesson.mp3"));
    } else {
      res.play(AssetSource("wrong-choice.mp3"));
    }
    bgMusic.stop();
    Future.delayed(const Duration(milliseconds: 1000), () {
      widget.onNext();
    });
  }

  void _procesarMateriales() {
    respuesta = letras[0];
    instruccionesPath = widget.instrucciones;
    instruccionesPath = instruccionesPath.replaceFirst('assets/', '');
  }

  void _setMusica() {
    bgMusic.play(AssetSource("WaterLesson.mp3"));
    bgMusic.setReleaseMode(ReleaseMode.loop);
  }

  void _shuffleElementos() {
    _animaciones!.shuffle();
    letras.shuffle();
  }

  void _setAnimacion() {
    _animaciones = List.generate(6, (index) {
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
  }

  @override
  void initState() {
    super.initState();
    _procesarMateriales();
    _setMusica();
    _setAnimacion();
    _shuffleElementos();
  }

  @override
  void dispose() {
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
                titulo: widget.titulo,
                onPressed: () {
                  instrucciones.play(AssetSource(instruccionesPath));
                },
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
                itemCount: letras.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisExtent: 200.0),
                itemBuilder: (context, index) {
                  return SlideTransition(
                    position: _animaciones![index],
                    child: !popped[index]
                        ? MyBubble(
                            onTap: () {
                              if (!pop) _checarRespuesta(letras[index], index);
                            },
                            letra: letras[index],
                          )
                        : Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}