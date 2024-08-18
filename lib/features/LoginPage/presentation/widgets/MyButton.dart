import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color colorB;
  final Color colorT;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.colorB,
    required this.colorT,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
        decoration: BoxDecoration(
          color: colorB,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text,
            style:  TextStyle(
              color: colorT,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
    );
  }
}