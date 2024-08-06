
import 'package:flutter/material.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionBricks.dart';

class LeccionDemo extends StatelessWidget {
  const LeccionDemo({super.key});

 @override
Widget build(BuildContext context) {
  return const Scaffold(
   body: Center(
    child: LeccionBricks(
      backgroundImage: 'assets/Bricks.png',
    )),
  );
  }
}

