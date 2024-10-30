import 'package:flutter/material.dart';

class MyProfileImage extends StatelessWidget {
  final String name;
  final String imagePath;
  //const MyProfileImage({super.key});
 const MyProfileImage({super.key, required this.name, required this.imagePath});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        width: 260,
        height: 240,
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: ClipOval(
                child: Image.asset(
                  imagePath,
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
