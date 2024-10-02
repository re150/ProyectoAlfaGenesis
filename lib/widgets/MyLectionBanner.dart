import 'package:flutter/material.dart';

class MyLectionBanner extends StatelessWidget {
  final String titulo;
  final VoidCallback onPressed;
  const MyLectionBanner({super.key, required this.titulo, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.white.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: Icon(Icons.star, color: Colors.yellow[700], size: 40),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
