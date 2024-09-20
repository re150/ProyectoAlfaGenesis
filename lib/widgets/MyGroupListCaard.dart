import 'package:flutter/material.dart';

class MyGroupListCard extends StatefulWidget {
  final String nombre;
  final void Function()? onTap;

  const MyGroupListCard({super.key, required this.nombre, required this.onTap});


  @override
  State<MyGroupListCard> createState() => _MyGroupListCardState();
}

class _MyGroupListCardState extends State<MyGroupListCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(widget.nombre),
        leading: Image.asset("assets/bee-kid.png"),
        onTap: widget.onTap,
      ),
    );
  }
}