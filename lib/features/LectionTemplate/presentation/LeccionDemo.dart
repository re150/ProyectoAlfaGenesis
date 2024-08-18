import 'package:flutter/material.dart';

class LeccionDemo extends StatelessWidget {
  const LeccionDemo({
    super.key,
  });

 @override
Widget build(BuildContext context) {
  final Widget? leccion = ModalRoute.of(context)!.settings.arguments as Widget;
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
      child: leccion,
   ),
  );
  }
}

