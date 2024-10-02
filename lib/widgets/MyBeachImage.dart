import 'package:flutter/material.dart';

class MyBeachImage extends StatelessWidget {
  final String imagen;
  final void Function() onTap;
  const MyBeachImage({super.key, required this.imagen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          image: DecorationImage(
            image: AssetImage(imagen),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
