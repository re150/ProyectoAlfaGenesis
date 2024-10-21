import 'package:flutter/material.dart';

class MyLevelButton extends StatelessWidget {
  final String nivel;
  final int puntaje; //ESTA ES LA VARIABLE PARA PASAR EL PUNTAJE
  final void Function()? onTap;
  const MyLevelButton({
    required this.onTap,
    required this.nivel,
    this.puntaje = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (puntaje > 5) {
      throw Exception("El puntaje no puede ser mayor a 5");
    }
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 4,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ]),
      width: MediaQuery.sizeOf(context).width / 2,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('assets/crab.png'),
                          fit: BoxFit.contain)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: const BoxDecoration(
                    color: Color(0xFF17A2B8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            nivel,
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: MediaQuery.sizeOf(context).width / 8,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                ...List.generate(
                            puntaje,
                            (index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              );
                            },
                          ),
                          ...List.generate(
                            5 - puntaje,
                            (index) {
                              return const Icon(
                                  Icons.star,
                                  color: Colors.black);
                            },
                          ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width / 2.3,
                        height: 2,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          height: MediaQuery.sizeOf(context).height / 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A31CD),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 7,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/ImagenesLecciones/boton-de-play.png",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Comenzar",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
