import 'package:flutter/material.dart';

class MyGroupListCard extends StatelessWidget {
  final String nombre;
  final String imgPath;
  final void Function()? onTap;

  const MyGroupListCard({super.key, required this.nombre, required this.imgPath, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}