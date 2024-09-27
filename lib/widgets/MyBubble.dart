import 'package:flutter/material.dart';

class MyBubble extends StatefulWidget {
  final void Function() onTap;
  final String letra;
  const MyBubble({super.key, required this.onTap, required this.letra});

  @override
  State<MyBubble> createState() => _MyBubbleState();
}

class _MyBubbleState extends State<MyBubble> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/bubble.png')),
        ),
        child: Center(
          child: Text(
            widget.letra,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width/14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
