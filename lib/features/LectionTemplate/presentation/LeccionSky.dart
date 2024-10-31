import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import 'package:proyecto/provider/TeamProvider.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';
import 'package:proyecto/widgets/MySkyBlock.dart';
import '../../../core/resources/checador_respuestas.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LeccionSky extends StatefulWidget {
  final List<Map<String, dynamic>> materiales;
  final String titulo;
  final String instrucciones;
  final VoidCallback onNext;
  const LeccionSky({
    super.key,
    required this.materiales,
    required this.titulo,
    required this.instrucciones,
    required this.onNext,
  });

  @override
  State<LeccionSky> createState() => _LeccionSkyState();
}

class _LeccionSkyState extends State<LeccionSky> with WidgetsBindingObserver {
  final bgMusic = AudioPlayer();
  final boton = AudioPlayer();
  final instrucciones = AudioPlayer();
  final nube = AudioPlayer();
  final respuestaSonido = AudioPlayer();
  String instruccionesPath = "";
  int? selectedIndexPalabras;
  int? selectedIndexImagenes;
  List<String> imagenes = [];
  List<String> palabras = [];
  List<String> sonidos = [];
  Map<String, String> sonidosPorPalabra = {};
  Map<String, String> respuesta = {};

  void _onTapSkyBlockPalabras(int index) {
    String sonido = sonidosPorPalabra[palabras[index]]!;
    sonido = sonido.replaceFirst('assets/', '');

    respuestaSonido.play(AssetSource(sonido));
    setState(() {
      selectedIndexPalabras = index;
    });
  }

  void _onTapSkyBlockImagenes(int index) {
    nube.play(AssetSource("SelectButton.mp3"));
    setState(() {
      selectedIndexImagenes = index;
    });
  }

   Future<void> _updatePuntaje() async {
       
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final dataProvider = Provider.of<ProfileProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final id = dataProvider.id;
    final name = dataProvider.name;
    final temaProvider = Provider.of<TeamProvider>(context, listen: false);
    String url = "";
    
    if(temaProvider.idTeam.isEmpty){
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
    final response = await http.patch(
      Uri.parse('$address/next/alfa$url'),
        headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
         body: jsonEncode(body)
        );
      if (response.statusCode == 200) {
      
    } else {
      throw Exception('Error al actualizar las estrellas');
    }
  
  }


  void _checarRespuesta(String palabra, String imagen) async {
    String? res = respuesta[palabra];
    bool esCorrecto = res == imagen;
    nube.play(
      esCorrecto
          ? AssetSource("successLesson.mp3")
          : AssetSource("wrong-choice.mp3"),
    );
    esCorrecto ? _updatePuntaje() : null;

    bgMusic.stop();
    final checar = Checador();
    await checar.checarRespuesta(context, esCorrecto);
    widget.onNext();
  }

  void _setMusica() {
    bgMusic.setReleaseMode(ReleaseMode.loop);
    bgMusic.play(AssetSource("Sky2.mp3"));
    bgMusic.setVolume(0.5);
  }

  void _processMateriales() {
    instruccionesPath = widget.instrucciones;
    instruccionesPath = instruccionesPath.replaceFirst('assets/', '');

    palabras = widget.materiales
        .where((material) => material["tipo_material"] == "palabra")
        .map((material) => material["valor_material"] as String)
        .toList();

    imagenes = widget.materiales
        .where((material) => material["tipo_material"] == "imagen")
        .map((material) => material["valor_material"] as String)
        .toList();

    sonidos = widget.materiales
        .where((material) => material["tipo_material"] == "audio")
        .map((material) => material["valor_material"] as String)
        .toList();

    sonidosPorPalabra = Map.fromIterables(palabras, sonidos);

    respuesta = Map.fromIterables(palabras, imagenes);

    palabras.shuffle();
    imagenes.shuffle();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setMusica();
    _processMateriales();
  }

  @override
  void dispose() {
    bgMusic.dispose();
    nube.dispose();
    instrucciones.dispose();
    respuestaSonido.dispose();
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/SkyBG.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                MyLectionBanner(
                  titulo: widget.titulo,
                  onPressed: () => boton.play(AssetSource(instruccionesPath)),
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: palabras.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MySkyblock(
                                  isSelected: selectedIndexPalabras == index,
                                  onTap: () => _onTapSkyBlockPalabras(index),
                                  content: Center(
                                    child: Text(
                                      palabras[index],
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(
                                text: "Verificar",
                                onTap: () => _checarRespuesta(
                                    palabras[selectedIndexPalabras!],
                                    imagenes[selectedIndexImagenes!]),
                                colorB: Colors.blue,
                                colorT: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: imagenes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MySkyblock(
                            content: Image.asset(
                              imagenes[index],
                              width: 100,
                              height: 100,
                            ),
                            isSelected: selectedIndexImagenes == index,
                            onTap: () => _onTapSkyBlockImagenes(index),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
