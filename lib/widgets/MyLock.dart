import 'package:flutter/material.dart';
class MyLock extends StatelessWidget {
  const MyLock({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.lock,
          color: Colors.black,
          size: 55,
        ),

        Icon(
          Icons.lock,
          color: Colors.white,
          size: 50,
        )
      ],
    );
  }
}