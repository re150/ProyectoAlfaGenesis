import 'package:flutter/material.dart';

class MyBrick extends StatelessWidget {
  final String texto;
  const MyBrick({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Brick.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.black,
            
          ),
        ),
      ),
    );
  }
}
