import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyStarButton.dart';

class Respuesta extends StatelessWidget {
  final bool esCorrecto;
  const Respuesta({super.key, required this.esCorrecto});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: esCorrecto ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.sizeOf(context).width / 1.5,
      height: MediaQuery.sizeOf(context).height / 1.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                esCorrecto
                    ? const MyStar(size: 100, correcto: true)
                    : const MyStar(size: 100, correcto: false)
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                esCorrecto
                    ? const Text("¡Correcto!",
                        style: TextStyle(fontSize: 30, color: Colors.white))
                    : const Text("¡Incorrecto! Sigue Practicando",
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.sizeOf(context).width / 1.8,
                  height: 5,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    height: MediaQuery.sizeOf(context).height / 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 10),
                        Text("Siguiente",
                            style: TextStyle(
                              fontSize: 20,
                              color: esCorrecto ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            )),
                        const Icon(Icons.double_arrow)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
