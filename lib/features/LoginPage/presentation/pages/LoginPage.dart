import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
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
                  Container(
                    width: 100.0, 
                    height: 100.0, 
                    child: Image.asset('assets/logoo.png'),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    padding: const EdgeInsets.all(20), 
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset('assets/logoo.png'),
                          width:  200.0, 
                          height: 200.0, 
                        ),
                        
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
                        const SizedBox(height: 40),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                          onPressed: () {
                          },
                          
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              backgroundColor: Colors.white, 
                            ),
                            child: const Text('Crear Cuenta',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
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
