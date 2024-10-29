import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/DataBaseHelper.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyTextField.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:proyecto/provider/AuthProvider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/resources/musica_fondo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Map<String, dynamic> data = {};

  void mostrarMensajeError(String mensaje){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Error"),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  Future<void> login(String email, String password) async {
    final emailRegex =  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final RegExp emailProfesor = RegExp(r'^[a-zA-Z0-9._%+-]+@jalisco\.edu\.com$');

    if (!emailRegex.hasMatch(email)) {
      mostrarMensajeError('Correo no válido');
      return;
    }

    if (password.length < 8) {
      mostrarMensajeError('La contraseña debe tener al menos 8 caracteres');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://$ipAdress:$port/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        data['email'] = email;
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        authProvider.setJwtToken(data['idToken'], data['email']);
        if(emailProfesor.hasMatch(email)) {
          Navigator.pushNamed(context, '/GroupCreationPage');
        } else {
          Navigator.pushNamed(context, '/profileSelection');
        }
      } else {
        mostrarMensajeError('Error');
      }
    } catch (e) {
      mostrarMensajeError(e.toString());
    }
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

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
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(100)),
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
                            "Iniciar Sesión",
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "/profileCreation",
                                );
                              },
                              child: const Text('Olvidé mi contraseña'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: MyButton(
                              text: "Entrar",
                              colorB: Colors.black,
                              colorT: Colors.white,
                              onTap: () {
                                login(emailController.text, passwordController.text);
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
