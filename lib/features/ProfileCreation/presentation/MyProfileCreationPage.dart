import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyButton.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyTextField.dart';

class MyProfilecreationpage extends StatefulWidget {
  const MyProfilecreationpage({super.key});

  @override
  State<MyProfilecreationpage> createState() => _MyProfilecreationpageState();
}

class _MyProfilecreationpageState extends State<MyProfilecreationpage> {
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
    // Bloquear la orientación a landscape
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
                      child: Container(
                        child: MyTextField(controller: nombreController, 
                        hintText: "Escribe tu nombre", 
                        obscureText: true)
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0
                      ), 
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index){
                       return GestureDetector(
                          onTap: (){
                            setState((){
                              selectedImage = imagePaths[index];
                            });
                          },
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover
                          ),
                       );
                    })
                ),
=======
import 'package:proyecto/features/LoginPage/presentation/widgets/MyButton.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyTextField.dart';
import 'package:proyecto/features/ProfileCreation/widgets/MyDropDownMenu.dart';

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
                                if(_gradoSeleccionado != null && _grupoSeleccionado != null && nombreUsuariocontroller.text.isNotEmpty){
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
>>>>>>> visual
              ),
            ],
          ),
        ),
<<<<<<< HEAD
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: MyButton(
              text: "Guardar", 
              colorB: Colors.blue,
              colorT: Colors.white,
              onTap: (){},
              ),
          ),
        ),
      ],
    ),
  );
}
}
=======
      ),
    );
  }
}
>>>>>>> visual
