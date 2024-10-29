import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import '../../../core/resources/checador_respuestas.dart';
import '../../../widgets/MyBeachImage.dart';
import '../../../widgets/MyLectionBanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
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
  String respuestaCorrecta = "";
  bool respondio = false;
  List<String> imagenes = [];


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


  void _checarRespuesta(String res) async {
    setState(() {
      respondio = true;
    });
    bool esCorrecto = res == respuestaCorrecta;
    esCorrecto ? _updatePuntaje() : null;
    sonidos[4].play(
        AssetSource(esCorrecto ? "successLesson.mp3" : "wrong-choice.mp3"));

    bgMusic.stop();
    final checar = Checador();
    await checar.checarRespuesta(context, esCorrecto);
    widget.onNext();
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
      respuestaCorrecta = imagenes[0];
      imagenes.shuffle();
    });
  }

  void _setMusica() {
    bgMusic.setReleaseMode(ReleaseMode.loop);
    bgMusic.play(AssetSource("Beach.mp3"));
    bgMusic.setVolume(0.5);
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
    WidgetsBinding.instance.addObserver(this);
    _procesarMateriales();
    _setMusica();
    _setAnimacion();
    Future.delayed(const Duration(milliseconds: 500), () {
      sonidos[4].play(AssetSource(instruccionesPath));
    });
  }

  @override
  void dispose() {
    for (AudioPlayer sonido in sonidos) {
      sonido.dispose();
    }
    _controller.dispose();
    bgMusic.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      bgMusic.resume();
    } else if(state == AppLifecycleState.paused) {
      bgMusic.pause();
    }
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
