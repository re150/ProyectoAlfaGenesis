import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeccionBeach extends StatefulWidget {
  const LeccionBeach({super.key});

  @override
  State<LeccionBeach> createState() => _LeccionBeachState();
}

class _LeccionBeachState extends State<LeccionBeach> {

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
    DeviceOrientation.landscapeLeft
  ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/ImagenesLecciones/BeawchBG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          
          child: Column(

            children: [

              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
