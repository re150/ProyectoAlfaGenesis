import 'package:flutter/material.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyButton.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyTextField.dart';
import 'package:proyecto/features/ProfileCreation/widgets/MyDropDownMenu.dart';

class MyProfileCreationPage extends StatefulWidget {
   //Map<String, dynamic>? user;

   MyProfileCreationPage(
    {
      //required this.user,
      super.key
    }
    );

  @override
  State<MyProfileCreationPage> createState() => _MyProfileCreationPageState();
}

class _MyProfileCreationPageState extends State<MyProfileCreationPage> {
  final TextEditingController nombreUsuariocontroller = TextEditingController();
  final List<String> _grupos = ["A", "B", "C"];
  final List<String> _grados = ["1", "2", "3"];
  

  String? _gradoSeleccionado;
  String? _grupoSeleccionado;

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
                                  
                                  print("Nombre de Usuario: ${nombreUsuariocontroller.text}");
                                  print("Grado: $_gradoSeleccionado");
                                  print("Grupo: $_grupoSeleccionado");
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
