import 'package:flutter/material.dart';

class MyProfileImage extends StatelessWidget {
  const MyProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        width: 260,
        height: 240,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Nombre",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/bee-kid.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
