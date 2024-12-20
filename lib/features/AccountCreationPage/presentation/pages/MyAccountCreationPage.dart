import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyTextField.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto/provider/AuthProvider.dart';
import 'dart:convert';
import '../../../../core/resources/musica_fondo.dart';

class MyAccountCreationPage extends StatefulWidget {
  const MyAccountCreationPage({super.key});

  @override
  State<MyAccountCreationPage> createState() => _MyAccountCreationPageState();
}

class _MyAccountCreationPageState extends State<MyAccountCreationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAuthController = TextEditingController();
  Map<String, dynamic> data = {};

  void clearFields() {
    passwordController.clear();
    passwordAuthController.clear();
  }

  void mostrarMensajeError(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  Future<void> newAccount(
    String email, String password, String confirmPassword) async {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final RegExp emailProfesor = RegExp(r'^[a-zA-Z0-9._%+-]+@jalisco\.edu\.mx$');
    if (!emailRegex.hasMatch(email)) {
      mostrarMensajeError('Correo no válido');
      clearFields();
      return;
    }

    if (password.length < 8) {
      mostrarMensajeError('La contraseña debe tener al menos 8 caracteres');
      clearFields();
      return;
    }

    if (password != confirmPassword) {
      mostrarMensajeError('Las contraseñas no coinciden');
      clearFields();
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://$ipAdress:$port/api/signUp'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final loginResponse = await http.post(
          Uri.parse('http://$ipAdress:$port/api/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
        );

        if (loginResponse.statusCode == 200) {
          final responseBody = jsonDecode(loginResponse.body);
          if (responseBody.containsKey('idToken')) {
            data = responseBody;
            data['email'] = email;
            final authProvider =
                Provider.of<AuthProvider>(context, listen: false);
            authProvider.setJwtToken(data['idToken'], data['email']);
            if (!emailProfesor.hasMatch(email)) {
              Navigator.pushNamed(context, '/profileCreation');
            } else {
              Navigator.pushNamed(context, '/GroupCreationPage');
            }
          } else {
            mostrarMensajeError(
                'Error: La respuesta del servidor no contiene los datos esperados');
            clearFields();
          }
        } else {
          mostrarMensajeError(
              'Error al iniciar sesión: ${loginResponse.statusCode}');
          clearFields();
        }
      } else {
        mostrarMensajeError(
            'Error al crear el usuario: ${response.statusCode}');
      }
    } catch (e) {
      mostrarMensajeError('Ocurrió un error: $e');
      clearFields();
    }
  }

  @override
  void initState() {
    super.initState();
    MusicaFondo().detenerMusica();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordAuthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),
                  image: DecorationImage(
                    image: AssetImage('assets/bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
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
                            controller: passwordAuthController,
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
                              newAccount(
                                  emailController.text,
                                  passwordController.text,
                                  passwordAuthController.text);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
