import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyButton.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyTextField.dart';
import 'package:proyecto/features/ProfileCreation/widgets/MyDropDownMenu.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto/provider/AuthProvider.dart';
import 'dart:convert';

class MyProfileCreationPage extends StatefulWidget {
  const MyProfileCreationPage({super.key});

  @override
  State<MyProfileCreationPage> createState() => _MyProfileCreationPageState();
}

class _MyProfileCreationPageState extends State<MyProfileCreationPage> {
  final TextEditingController nombreUsuariocontroller = TextEditingController();
  final List<String> _grupos = ["A", "B", "C"];
  final List<String> _grados = ["1", "2", "3"];
  
  String? _gradoSeleccionado;
  String? _grupoSeleccionado;
  
 

 Future<void> newProfile(String name, String grado, String grupo) async {
  int? parsedGrado;
  final authProvider = Provider.of<AuthProvider>(context, listen: false);
    // Acceder al JWT token
    final jwtToken = authProvider.jwtToken;
    final email = authProvider.email;
  try {
    parsedGrado = int.parse(grado);
  } catch (e) {
    print('Error al convertir grado a entero: $e');
    return;
  }

  try {
    final response = await http.post(
      Uri.parse('http://$ipAdress:$port/next/alfa/NewProfile'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "name": name,
        "level": 1,
        "grado": parsedGrado,
        "grupo": grupo,
        "imgUrl": "kml",
        "email": email,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/profileSelection');
    } else {
      print('Error en la creación del perfil. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    print('Ocurrió un error durante la solicitud: $e');
  }
}

   @override
  void initState() {
    super.initState();
   // widget.user = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
                    height: MediaQuery.of(context).size.height*0.44,
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
                    height: MediaQuery.of(context).size.height*0.56,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView(
                        children: [
                          const Text(
                            "Crear Perfil",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 50),

                          const Text(
                            "Nombre de Usuario",
                            style: TextStyle(
                              fontSize: 20,
                              ),
                            ),
                          MyTextField(
                            controller: nombreUsuariocontroller,
                            hintText: "Nombre de Usuario",
                            obscureText: false,
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Grado",
                            style: TextStyle(
                              fontSize: 20,
                              ),
                            ),

                         MyDropDownMenu(
                          value: _gradoSeleccionado, 
                          items: _grados, 
                          hintText: "Grado", 
                          onChanged: (String? newValue) {
                            setState(() {
                              _gradoSeleccionado = newValue;
                            });
                          }
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Grupo",
                            style: TextStyle(
                              fontSize: 20,
                              ),
                            ),

                          MyDropDownMenu(
                            value: _grupoSeleccionado, 
                            items: _grupos, 
                            hintText: "Grupo", 
                            onChanged: (String? newValue){
                              setState(() {
                                _grupoSeleccionado = newValue;
                              });
                            }),
                          const SizedBox(height: 20),

                          Align(
                            alignment: Alignment.center,
                            child: MyButton(
                              text: "Crear Perfil",
                              onTap: (){                                //Aqui va la funcionalidad de la BD
                                if(
                                  _gradoSeleccionado != null 
                                && _grupoSeleccionado != null 
                                && nombreUsuariocontroller.text.isNotEmpty){
                                  newProfile(nombreUsuariocontroller.text, _gradoSeleccionado!, _grupoSeleccionado!);
                                }
                              },
                              colorB: Colors.black,
                              colorT: Colors.white,
                              ),
                          )
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
