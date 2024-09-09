import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/ProfileVariables.dart';
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
  
void saveData(String name, String grado, String grupo) {
  final statusData = Provider.of<ProfileVariables>(context, listen: false);
  int? parsedGrado;
  try {
    parsedGrado = int.parse(grado);
  } catch (e) {
    print('Error al convertir grado a entero: $e');
    return;
  }

  statusData.setData(name, parsedGrado, grupo);
  print('Name: $name, Grado: $parsedGrado, Grupo: $grupo');
  Navigator.pushNamed(context, '/profileEdition');
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
                                  saveData(nombreUsuariocontroller.text, _gradoSeleccionado!, _grupoSeleccionado!);
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
