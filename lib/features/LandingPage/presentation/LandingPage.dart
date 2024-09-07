import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyButton.dart';



class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset('assets/logoo.png'),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/logoo.png'),
                      width: 200.0,
                      height: 200.0,
                    ),

                    MyButton(
                      text: "Entrar", 
                      colorB: Colors.black,
                      colorT: Colors.white,
                      onTap: (){
                        Navigator.pushNamed(context, '/login');
                      },
                      ),
                    
                    const SizedBox(height: 40),

                    Align(
                      alignment: Alignment.center,
                      child: MyButton(
                        text: "Crear Cuenta", 
                        colorB: Colors.black,
                        colorT: Colors.white,
                        onTap: (){
                          Navigator.pushNamed(context, '/accountCreation');
                        }),
                    ),   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}