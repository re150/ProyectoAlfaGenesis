import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/checador_respuestas.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import '../../../widgets/MyBubble.dart';
import '../../../widgets/MyLectionBanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Esta vista se encarga de la leccion correspondiente a la de burbujas
///
/// Hola

class LeccionBubbles extends StatefulWidget {
  final List<Map<String, dynamic>> materiales;
  final String titulo;
  final VoidCallback onNext;
  final String instrucciones;

  const LeccionBubbles({
    super.key,
    required this.materiales,
    required this.titulo,
    required this.onNext,
    required this.instrucciones,
  });

  @override
  State<LeccionBubbles> createState() => _LeccionBubblesState();
}

class _LeccionBubblesState extends State<LeccionBubbles>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final bgMusic = AudioPlayer();
  final boton = AudioPlayer();
  final res = AudioPlayer();
  final instrucciones = AudioPlayer();
  final instruccionesEtapa = AudioPlayer();
  List<String> letras = [];
  String instruccionesPath = "";
  String instruccionesEtapaPath = "";
  String respuesta = "";
  List<AnimationController>? _controllers;
  List<Animation<Offset>>? _animaciones;
  List<bool> popped = [false, false, false, false, false];
  bool pop = false;

  Future<void> _updatePuntaje() async {
       
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final dataProvider = Provider.of<ProfileProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final id = dataProvider.id;
    final name = dataProvider.name;
      
      
    final response = await http.patch(
      Uri.parse('http://$ipAdress:$port/next/alfa/Punctuation'),
        headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
        body: jsonEncode({
          "id": id,
          "name": name,
          "stars": 1,
        }),
    );
      if (response.statusCode == 200) {
      
    } else {
      throw Exception('Error al actualizar las estrellas');
    }
  
  }

  void _checarRespuesta(String letra, int index) async {
    boton.play(AssetSource("BubblePop.mp3"));
    bool esCorrecto = false;
    setState(() {
      pop = true;
      popped[index] = true;
    });
    if (letra == respuesta) {
      res.play(AssetSource("successLesson.mp3"));
      esCorrecto = true;
      _updatePuntaje();
    } else {
      res.play(AssetSource("wrong-choice.mp3"));
    }
    bgMusic.stop();
    final checar = Checador();
    await checar.checarRespuesta(context, esCorrecto);
    widget.onNext();
  }

  void _procesarMateriales() {
    setState(() {
      letras = widget.materiales
          .where((material) => material["tipo_material"] == "palabra")
          .map((material) => material["valor_material"] as String)
          .toList();
      respuesta = letras[0];

      instruccionesEtapaPath = widget.materiales
          .where((material) => material["tipo_material"] == "audio")
          .map((material) => material["valor_material"] as String)
          .first;
      instruccionesEtapaPath =
          instruccionesEtapaPath.replaceFirst('assets/', '');

      instruccionesPath = widget.instrucciones;
      instruccionesPath = instruccionesPath.replaceFirst('assets/', '');
    });
  }

  void _setMusica() {
    bgMusic.play(AssetSource("WaterLesson.mp3"));
    bgMusic.setReleaseMode(ReleaseMode.loop);
    bgMusic.setVolume(0.5);
  }

  void _shuffleElementos() {
    _animaciones!.shuffle();
    letras.shuffle();
  }

  void _setAnimacion() {
    _controllers = List.generate(6, (index) {
      final controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      );
      Future.delayed(Duration(milliseconds: index * 500), () {
        if (mounted) {
          controller.repeat(reverse: true);
        }
      });
      return controller;
    });

    _animaciones = _controllers!.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, -0.1),
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _procesarMateriales();
    _setMusica();
    _setAnimacion();
    _shuffleElementos();
    Future.delayed(const Duration(milliseconds: 500), () {
      instrucciones.play(AssetSource(instruccionesEtapaPath));
    });
  }

  @override
  void dispose() {
    _controllers?.forEach((controller) => controller.dispose());
    bgMusic.dispose();
    boton.dispose();
    instrucciones.dispose();
    res.dispose();
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
            image: AssetImage("assets/OceanBG.jpg"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Row(
            children: [
              MyLectionBanner(
                titulo: widget.titulo,
                onPressed: () {
                  instrucciones.play(AssetSource(instruccionesEtapaPath));
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
