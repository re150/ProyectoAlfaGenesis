import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyButton.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
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

          DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.4,
              maxChildSize: 0.6,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),

                  child: SingleChildScrollView(      
                    controller: scrollController,
                    child: Column(
                      children: [
                        SizedBox( height: MediaQuery.of(context).size.height * 0.02),
                        
                        Container(
                          width: 80,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        SizedBox( height: MediaQuery.of(context).size.height * 0.01),

                        IconButton(
                          onPressed: () {},
                          icon: const ImageIcon(AssetImage("assets/logoo.png")),
                          iconSize: 200,
                          color: Colors.black,
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                        MyButton(
                            text: 'Entrar',
                            onTap: () => _entrar(context),
                            colorB: Colors.black,
                            colorT: Colors.white,
                            width: MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
                                ? MediaQuery.of(context).size.width * 0.34
                                : MediaQuery.of(context).size.height * 0.37,
                                ),
                        
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        
                        MyButton(
                          text: '''Iniciar Como \n     Grupo''',
                          onTap: () => _entrarGrupo(context),
                          colorB: Colors.black,
                          colorT: Colors.white,
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),

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

                        SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                        const SizedBox(child:  Text("AlfaGenesis ©2024 Derechos Reservados."),)
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}