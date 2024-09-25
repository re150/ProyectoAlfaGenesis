import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyGroupListCard.dart';

class MyGroupCard extends StatefulWidget {
  final void Function()? onTap;
  final int numero;
  final List<String> lista;
  const MyGroupCard({
    super.key,
    required this.lista,
    required this.numero,
    required this.onTap,
  });

  @override
  State<MyGroupCard> createState() => _MyGroupCardState();
}

class _MyGroupCardState extends State<MyGroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 2),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Grupo ${widget.numero}",
                    style: const TextStyle(fontSize: 23),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: widget.lista.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyGroupListCard(
                          nombre: widget.lista[index], onTap: () {}),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            MyButton(
                text: "Usar",
                onTap: widget.onTap,
                colorB: Colors.blue,
                colorT: Colors.white)
          ],
        ),
      ),
    );
  }
}
