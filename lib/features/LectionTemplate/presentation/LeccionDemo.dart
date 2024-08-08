
import 'package:flutter/material.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionBricks.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionBubbles.dart';

class LeccionDemo extends StatelessWidget {
  const LeccionDemo({
    super.key,
  });

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Hola'),
      backgroundColor: Colors.blue.withOpacity(0.8),
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {
          },
        ),
      ],
    ),
   body: Center(
    child: LeccionBricks(
      backgroundImage: 'assets/WallBricks.jpg',
    )),
  );
  }
}

