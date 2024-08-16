import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/features/LectionTemplate/presentation/LeccionBricks.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyButton.dart';
import 'package:proyecto/features/LoginPage/presentation/widgets/MyTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final int ruta = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: SafeArea(
        
        child: Container(

          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), 
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8), 
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 50),

                          const Text("Iniciar Sesión",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 50),
                          
                          MyTextField(

                            controller: emailController, 
                            hintText: "Ingresar Correo", 
                            obscureText: false
                            
                            ),

                          const SizedBox(height: 20),

                          MyTextField(

                            controller: passwordController, 
                            hintText: "Ingresar Contraseña", 
                            obscureText: true

                            ),

                          const SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                              },
                              child: const Text('Olvidé mi contraseña'),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: MyButton(
                              text: "Entrar", 
                              onTap: (){
                                  Navigator.pushNamed(context, '/leccion', arguments: LeccionBricks()); //AQUI VA LA FUNCIONALIDAD DE LA DB GERA
                                },
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}