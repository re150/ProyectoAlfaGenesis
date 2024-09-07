import 'package:flutter/material.dart';

class MyLectionBanner extends StatelessWidget {
  final String titulo;
  const MyLectionBanner({super.key, required this.titulo});

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
          Icon(Icons.star, color: Colors.yellow[700], size: 40),
        ],
      ),
    );
  }
}
