import 'package:flutter/material.dart';
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
              onTap: (){},
              ),
          ),
        ),
      ],
    ),
  );
}
}