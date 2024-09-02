import 'package:flutter/material.dart';

class MyLevelButton extends StatelessWidget {
  final Color color;
  final String nivel;
  final void Function()? onTap;
  const MyLevelButton({
    required this.onTap,
    required this.nivel,
    required this.color,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        color: color,
        child: Center(
          child: Text(
            'Nivel $nivel',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}