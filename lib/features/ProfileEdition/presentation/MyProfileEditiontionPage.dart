import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyTextField.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyProfileEditionPage extends StatefulWidget {
  const MyProfileEditionPage({super.key});

  @override
  State<MyProfileEditionPage> createState() => _MyProfileEditionPageState();
}

class _MyProfileEditionPageState extends State<MyProfileEditionPage> {
  final TextEditingController nombreController = TextEditingController();
  final List<String> imagePaths = [
    'assets/1.jpg',
    'assets/AlfaGenesisWB2.webp',
    'assets/altavoz.png',
    'assets/bee-kid.png',
    'assets/bg.jpg',
    'assets/Bricks.png',
    'assets/bubble.png',
    'assets/cat.png',
    'assets/click-gesture_63576.png',
    'assets/logo.png',
    'assets/logoo.png',
    'assets/OceanBG.jpg',
    'assets/pez3.jpg',
    'assets/swipe up.png',
    'assets/swipe.png',
    'assets/WallBricks.jpg',
  ];
  String selectedImage = 'assets/cat.png';
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  Future<void> newProfile(String Urlimg) async {
  final authProvider = Provider.of<AuthProvider>(context, listen: false);
  final dataProfile = Provider.of<ProfileProvider>(context,listen: false);

  final jwtToken = authProvider.jwtToken;
  final email = authProvider.email;

  try {
    final response = await http.post(
      Uri.parse('http://$ipAdress:$port/next/alfa/NewProfile'),
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
        "teamStatus" : false
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
  dataProfile.clearData();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Perfil'),
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
                            color: Colors.blue,
                            image: DecorationImage(
                              image: AssetImage(selectedImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: MyTextField(
                              controller: nombreController,
                              hintText: "Escribe tu nombre",
                              obscureText: true)
                              ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.grey,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                          itemCount: imagePaths.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedImage = imagePaths[index];
                                });
                              },
                              child: Image.asset(imagePaths[index],
                                  fit: BoxFit.cover),
                            );
                          })),
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
                    newProfile(selectedImage);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
