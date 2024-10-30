import 'package:flutter/material.dart';

class MyGroupListCard extends StatelessWidget {
  final String nombre;
  final String imgPath;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const MyGroupListCard({super.key, required this.nombre, required this.imgPath, required this.onTap, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.outline,
        ),
        child: ListTile(
          title: Text(nombre),
          leading: Image.asset(imgPath),
          onTap: onTap,
        ),
      ),
    );
  }
}