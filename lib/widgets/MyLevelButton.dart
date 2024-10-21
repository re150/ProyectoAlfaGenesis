import 'package:flutter/material.dart';

class MyLevelButton extends StatelessWidget {
  final Color color;
  final String nivel;
  final void Function()? onTap;
  const MyLevelButton(
      {required this.onTap,
      required this.nivel,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                    decoration: BoxDecoration(
                      color: color,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nivel,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width / 2.3,
                          height: 2,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
