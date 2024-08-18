import 'package:flutter/material.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionBubbles.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyButton.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyTextField.dart';

class MyAccountCreationPage extends StatefulWidget {
  const MyAccountCreationPage({super.key});

  @override
  State<MyAccountCreationPage> createState() => _MyAccountCreationPageState();
}

class _MyAccountCreationPageState extends State<MyAccountCreationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
                      image: DecorationImage(
                        image: AssetImage('assets/bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView(
                        children: [
                          const SizedBox(height: 50),
                          const Text(
                            "Crear Cuenta",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 50),
                          MyTextField(
                              controller: emailController,
                              hintText: "Ingresar Correo",
                              obscureText: false),
                          const SizedBox(height: 20),
                          MyTextField(
                              controller: passwordController,
                              hintText: "Ingresar Contraseña",
                              obscureText: true),
                          const SizedBox(height: 20),
                          MyTextField(
                              controller: passwordController,
                              hintText: "Confirmar Contraseña",
                              obscureText: true),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.center,
                            child: MyButton(
                              text: "Crear Cuenta",
                              colorB: Colors.black,
                              colorT: Colors.white,
                              onTap: () {
                                Navigator.pushNamed(context, '/leccion',
                                    arguments:
                                        LeccionBubbles()); //AQUI VA LA FUNCIONALIDAD DE LA DB YAHIR
                              },
                            ),
                          ),
                        ],
                      ),
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
