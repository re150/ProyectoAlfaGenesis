import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';

class LeccionSky extends StatefulWidget {
  const LeccionSky({super.key});

  @override
  State<LeccionSky> createState() => _LeccionSkyState();
}

class _LeccionSkyState extends State<LeccionSky> {
  final String titulo = "Titulo de leccion";
  final bgMusic = AudioPlayer();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    bgMusic.setReleaseMode(ReleaseMode.loop);
    bgMusic.play(AssetSource("Sky2.mp3"));
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
    bgMusic.dispose();
    super.dispose();
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
                  titulo: titulo,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
