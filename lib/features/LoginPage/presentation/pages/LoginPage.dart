import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                  Navigator.pushNamed(context, '/leccion');
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
/*
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
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
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(height: 50, width: 50,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    padding: const EdgeInsets.all(20), 
                    child: Column(
                      children: <Widget>[
                        const Text("Iniciar Sesión",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text("Nombre de Usuario"),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Tú Nomdre de Usuario',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text("Contraseña"),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Tú Contraseña',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                           onPressed: () {
                            Navigator.pushNamed(context, '/leccion');
                          },
                          
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              backgroundColor: Colors.black,
                            ),
                            child: const Text('Entrar',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                            },
                            child: const Text('Olvidé mi contraseña'),
                          ),
                        ),
                      ],
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



 */