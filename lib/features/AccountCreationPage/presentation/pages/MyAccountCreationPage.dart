import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyTextField.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:proyecto/provider/GlobalVariables.dart';


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
      emailController.clear();
      passwordController.clear();
      passwordAuthController.clear();
    }

   Future<void> newAccount(String email, String password, String confirmPassword) async {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      print('Correo no válido');
      clearFields();
      return;
    }

    
    if (password.length < 8) {
      print('La contraseña debe tener al menos 8 caracteres');
      clearFields();
      return;
    }


    if (password != confirmPassword) {
      print('Las contraseñas no coinciden');
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
            "email":email,
            "password": password,
          }),
          );

    if (response.statusCode == 200) {
      final login = await http.post(
      Uri.parse('http://$ipAdress:$port/api/login'), 
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
            "email":email,
            "password": password,
          }),
          );
    if (login.statusCode == 200) {
      final responseBody = jsonDecode(login.body);
       data = responseBody;
       data['email'] = email;
        Navigator.pushNamed(context, '/profileCreation');
    } else{
      print('Error al iniciar session: ${response.statusCode}');
      clearFields();
    }   
    } else {
      print('Error al crear el usuario: ${response.statusCode}');
    }
  } catch (e) {
    print('Ocurrió un error: $e');
    clearFields();
  }
}

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);

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
                                newAccount(emailController.text, passwordController.text, passwordAuthController.text);

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
