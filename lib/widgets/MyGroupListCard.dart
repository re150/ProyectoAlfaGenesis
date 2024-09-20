import 'package:flutter/material.dart';

class MyGroupListCard extends StatelessWidget {
  final String nombre;
  final void Function()? onTap;

  const MyGroupListCard({super.key, required this.nombre, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 250, 220, 252)
      ),
      child: ListTile(
        title: Text(nombre),
        leading: Image.asset("assets/bee-kid.png"),
        onTap: onTap,
      ),
    );
  }
}