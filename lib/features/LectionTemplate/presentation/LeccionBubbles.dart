import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LeccionBubbles extends StatefulWidget {
  const LeccionBubbles({super.key});

  @override
  State<LeccionBubbles> createState() => _LeccionBubblesState();
}

class _LeccionBubblesState extends State<LeccionBubbles> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  final List<Offset> _positions = List.generate(5, (_) => Offset.zero);

  @override
  void initState() {
    super.initState();
        SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..repeat();

    _controller.addListener(() {
      setState(() {
        for (int i = 0; i < _positions.length; i++) {
          _positions[i] = Offset(
            _random.nextDouble() * MediaQuery.of(context).size.width - 100,
            _random.nextDouble() * MediaQuery.of(context).size.height - 100,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
  ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset("assets/OceanBG.jpg", fit: BoxFit.cover),
        ),
        ...List.generate(5, (index) {
          return AnimatedPositioned(
            duration: const Duration(seconds: 5),
            left: _positions[index].dx,
            right: _positions[index].dy,
            child: Image.asset(
              'assets/bubble.png',
              width: 100,
              height: 100,
            ),
          );
        }),
      ],
    );
  }
}
