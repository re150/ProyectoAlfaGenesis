import 'package:flutter/material.dart';

class MyLevelButton extends StatefulWidget {
  final String nivel;
  final int puntaje;
  final VoidCallback onTap;
  final String imagen;
  const MyLevelButton({
    required this.onTap,
    required this.nivel,
    this.puntaje = 0,
    required this.imagen,
    super.key,
  });

  @override
  State<MyLevelButton> createState() => _MyLevelButtonState();
}

class _MyLevelButtonState extends State<MyLevelButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void _animar() {
    if (_controller.isAnimating) {
      if (mounted) {
        _controller.stop();
      }
    } else {
      if (mounted) {
        _controller.reset();
        _controller.forward();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          widget.onTap();
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

  @override
  Widget build(BuildContext context) {
    if (widget.puntaje > 5) {
      throw Exception("El puntaje no puede ser mayor a 5");
    }
    return GestureDetector(
      onTap: _animar,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_controller.value * 3.1416 * 2)
              ..rotateY(_controller.value * 3.1416 * 2),
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
          width: MediaQuery.sizeOf(context).width / 2,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/${widget.imagen}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width / 2,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xFF17A2B8),
                          Colors.blueAccent,
                        ]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.nivel,
                                style: const TextStyle(fontSize: 30),
                              ),
                              const SizedBox(width: 10),
                             
                            ],
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2.3,
                            height: 2,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 2.5,
                            height: MediaQuery.sizeOf(context).height / 10,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A31CD),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 7,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/ImagenesLecciones/boton-de-play.png",
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  "Comenzar",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
