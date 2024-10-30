import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/widgets/MyButton.dart';

import '../../../core/resources/musica_fondo.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void _entrar(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  void _entrarGrupo(BuildContext context) {
    Navigator.pushNamed(context, '/GroupCreationPage');
  }

  void _crearCuenta(BuildContext context) {
    Navigator.pushNamed(context, '/accountCreation');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.55,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),
                      image: DecorationImage(
                        image: AssetImage('assets/bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Por un futuro con más educación",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: const [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width*0.45,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        IconButton(
                          onPressed: () {},
                          icon: const ImageIcon(AssetImage("assets/logoo.png")),
                          iconSize: 200,
                          color: Colors.black,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        MyButton(
                          text: 'Entrar',
                          onTap: () => _entrar(context),
                          colorB: Colors.black,
                          colorT: Colors.white,
                          width: MediaQuery.of(context).size.width <
                                  MediaQuery.of(context).size.height
                              ? MediaQuery.of(context).size.width * 0.34
                              : MediaQuery.of(context).size.height * 0.37,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09),
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: MyButton(
                            text: 'Crear Cuenta',
                            onTap: () => _crearCuenta(context),
                            colorB: Colors.white,
                            colorT: Colors.black,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09),
                        const SizedBox(
                          child: Text("AlfaGenesis ©2024 Derechos Reservados."),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
