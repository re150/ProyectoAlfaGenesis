import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyLock.dart';
import 'package:proyecto/widgets/MyStarButton.dart';

class MyRoadmapButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String titulo;
  final bool isLocked;
  final int puntaje;
  final String imagen;
  const MyRoadmapButton({
    super.key,
    required this.onPressed,
    required this.titulo,
    required this.isLocked,
    required this.imagen,
    this.puntaje = 0,
  });

  @override
  State<MyRoadmapButton> createState() => _MyRoadmapButtonState();
}

class _MyRoadmapButtonState extends State<MyRoadmapButton>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  final pressed = AudioPlayer();
  late int puntos;

  @override
  void initState() {
    super.initState();
    puntos = widget.puntaje > 5 || widget.puntaje < 0 ? 0 : widget.puntaje;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          widget.onPressed();
          _controller.reset();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rotar() {
    pressed.play(
        AssetSource(widget.isLocked ? "wrong-choice.mp3" : "SelectButton.mp3"));
    if (!widget.isLocked) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _rotar,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_controller.value * 3.1416 * 2),
            child: child,
          );
        },
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          width: MediaQuery.sizeOf(context).width * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imagen),
              fit: BoxFit.cover,
              colorFilter: widget.isLocked
                  ? const ColorFilter.matrix(<double>[
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ])
                  : null,
            ),
            color: Colors.blue,
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 9,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              if (!widget.isLocked)
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return MyStar(correcto: index < puntos, size: 35,);
                    }),
                  ),
                ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: widget.isLocked ? const MyLock() : null,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.deepPurple],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
