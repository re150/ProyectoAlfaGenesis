
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeccionDemo extends StatefulWidget {
  const LeccionDemo({super.key});

  @override
  State<LeccionDemo> createState() => _LeccionDemoState();
}

class _LeccionDemoState extends State<LeccionDemo> {
@override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Bricks.png'), 
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 40), 
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), 
              borderRadius: BorderRadius.circular(10), 
            ),
            child: Row(
                children:  [
                   const Text(
                    'Leccion numero 3: Silabas diferentes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),  
                  ),
                  Spacer(),
                   InkWell(
                    onTap: () {
                      print('Volume button pressed');
                    },
                     child: const Icon(
                      Icons.volume_up,
                      color: Colors.white,
                       ),
                   ),
                ],
            ),
          ),
        ),
      ],
    ),
  );
}
}