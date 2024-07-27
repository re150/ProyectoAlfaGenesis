import 'package:flutter/material.dart';

void main(){
  runApp(const MyAccount());
}
class MyAccount extends StatelessWidget {
  const MyAccount({super.key});
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    padding: const EdgeInsets.all(80), 
                    child: Column(
                      children: <Widget>[
                        const Text("Crear Cuenta",
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
      ),
    );
  }
}
