import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/widgets/MyDropDownMenu.dart';
import 'package:proyecto/widgets/MyGroupListCaard.dart';
import 'package:proyecto/widgets/MyLectionBanner.dart';

class MyGroupCreationPage extends StatefulWidget {
  const MyGroupCreationPage({super.key});

  @override
  State<MyGroupCreationPage> createState() => _MyGroupCreationPageState();
}

class _MyGroupCreationPageState extends State<MyGroupCreationPage> {
  final List<String> _grados = ["1A", "1B", "1C"];
  int _items = 0;
  String? _gradoSeleccionado;
  List<Color> colores = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.grey
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 100,
                height: 100,
                color: colores[0],
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lista de alumnos",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: MyDropDownMenu(
                    value: _gradoSeleccionado,
                    items: _grados,
                    hintText: "Grupo",
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          _items = _grados.indexOf(newValue!)*10 + 10;
                          _gradoSeleccionado = newValue;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Row(children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: _items,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyGroupListCard(
                                nombre: "Nombre: ${index+1}",
                                onTap: () {
                                  setState(() {
                                    colores.shuffle();
                                  });
                                },
                              ),
                            );
                          }),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
