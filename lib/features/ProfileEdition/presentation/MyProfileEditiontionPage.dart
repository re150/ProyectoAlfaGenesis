import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:proyecto/widgets/MyProfileImageButton.dart';

class MyProfileEditionPage extends StatefulWidget {
  const MyProfileEditionPage({super.key});

  @override
  State<MyProfileEditionPage> createState() => _MyProfileEditionPageState();
}

class _MyProfileEditionPageState extends State<MyProfileEditionPage> {
  final TextEditingController nombreController = TextEditingController();
  int puntajeTotal = 0;
  final List<String> imagePaths = [
    'Gato.png',
    'Abeja.png',
    'Abeja2.png',
    'Caracol.png',
    'Cerdo.png',
    'Dinosaurio.png',
    'Elefante.png',
    'Gato2.png',
    'Gato3.png',
    'Jirafa.png',
    'Marmota.png',
    'Oso2.png',
    'Osos.png',
    'Oveja.png',
    'Oveja2.png',
    'Perro.png',
    'Perro2.png',
    'Pinguino.png',
    'Pug.png',
    'Rana.png',
    'Reno.png',
    'Zorro.png',
    'Zorro2.png',
  ];
  String selectedImage = 'Gato.png';

   Future<void> _loadPuntaje() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final dataProvider = Provider.of<ProfileProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final id = dataProvider.id;
    final name = dataProvider.name;

    final response = await http.get(
      Uri.parse('$address/next/alfa/GetPunctuation/$id/$name'),
      headers: <String, String>{'Authorization': 'Bearer $jwtToken'},
    );
    if (response.statusCode == 200) {
      setState(() {
        puntajeTotal = int.parse(response.body);
      });
    } else {
      throw Exception('Error al cargar las estrellas');
    }
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

  @override
  void initState() {
    super.initState();
    _loadPuntaje();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
  }

  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }

  Future<void> newProfile(String Urlimg) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final dataProfile = Provider.of<ProfileProvider>(context, listen: false);

    final jwtToken = authProvider.jwtToken;
    final email = authProvider.email;

    try {
      final response = await http.post(
        Uri.parse('$address/next/alfa/NewProfile'),
        headers: <String, String>{
          'Authorization': 'Bearer $jwtToken',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "name": dataProfile.name,
          "level": 1,
          "grado": dataProfile.grado,
          "grupo": dataProfile.grupo,
          "imgUrl": Urlimg,
          "email": email,
          "stars": 0,
          "teamStatus": false
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/profileSelection');
      } else {
        mostrarMensajeError(
            'Error en la creación del perfil. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      mostrarMensajeError('Ocurrió un error durante la solicitud: $e');
    }
    dataProfile.clearData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/ProfilePictures/$selectedImage"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0),
                      itemCount: imagePaths.length,
                      itemBuilder: (context, index) {
                        return MyProfileImageButton(
                          imagepath: imagePaths[index],
                          isUnlocked: puntajeTotal >= index*10,
                          isSelected: selectedImage == imagePaths[index],
                          puntos: index * 10,
                          onTap: () {
                            setState(() {
                              selectedImage = imagePaths[index];
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: MyButton(
                text: "Guardar",
                colorB: Colors.blue,
                colorT: Colors.white,
                onTap: () {
                  newProfile("assets/ProfilePictures/$selectedImage");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
