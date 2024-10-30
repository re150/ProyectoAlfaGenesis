import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileProvider.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyDropDownMenu.dart';

import 'package:proyecto/widgets/MyTextField.dart';

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

  void saveData(String name, String grado, String grupo) {
    final statusData = Provider.of<ProfileProvider>(context, listen: false);
    int? parsedGrado;
    try {
      parsedGrado = int.parse(grado);
    } catch (e) {
      mostrarMensajeError('Error al obtener grado: $e');
      return;
    }

    statusData.setDataCreate(name, parsedGrado, grupo);
    Navigator.pushNamed(context, '/profileEdition');
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
  void dispose() {
    nombreUsuariocontroller.dispose();
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
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
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
                          },
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
                          onChanged: (String? newValue) {
                            setState(() {
                              _grupoSeleccionado = newValue;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: MyButton(
                            text: "Crear Perfil",
                            onTap: () {
                              if (_gradoSeleccionado != null &&
                                  _grupoSeleccionado != null &&
                                  nombreUsuariocontroller.text.isNotEmpty) {
                                saveData(nombreUsuariocontroller.text,
                                    _gradoSeleccionado!, _grupoSeleccionado!);
                              }
                            },
                            colorB: Colors.black,
                            colorT: Colors.white,
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
