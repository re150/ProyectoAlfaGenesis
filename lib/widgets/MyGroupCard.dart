import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyGroupListCard.dart';

class MyGroupCard extends StatelessWidget {
  final int numero;
  final List<String> lista;
  const MyGroupCard({super.key, required this.lista, required this.numero});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.35,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),

      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text("Grupo $numero", style: const TextStyle(fontSize: 25)),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyGroupListCard(nombre: lista[index], onTap: () {}),
                );
              },
            ),
          ),
          MyButton(
              text: "Usar",
              onTap: () {},
              colorB: Colors.blue,
              colorT: Colors.white)
        ],
      ),
    );
  }
}
