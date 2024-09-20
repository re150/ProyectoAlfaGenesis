import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyGroupCard.dart';
import '../../../widgets/MyDropDownMenu.dart';
import '../../../widgets/MyGroupListCard.dart';

class MyGroupCreationPage extends StatefulWidget {
  const MyGroupCreationPage({super.key});

  @override
  State<MyGroupCreationPage> createState() => _MyGroupCreationPageState();
}

class _MyGroupCreationPageState extends State<MyGroupCreationPage> {
  final List<String> _grados = ["1A", "1B", "1C"];
  List<String> _tarjetaSeleccionada = List.generate(0, (index) => "");
  List<String> _itemsList =
      List.generate(10, (index) => "Nombre: ${index + 1}");
  String? _gradoSeleccionado;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.red,
                          iconSize: 40,
                          onPressed: () {},
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Crear Grupo",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 2,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      MyButton(
                        text: "Crear",
                        onTap: () {},
                        colorB: Colors.blue,
                        colorT: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _tarjetaSeleccionada.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyGroupCard(
                                numero: index + 1,
                                lista: _tarjetaSeleccionada,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                          _gradoSeleccionado = newValue;
                          _itemsList = List.generate(
                            _grados.indexOf(newValue!) * 10 + 10,
                            (index) => "Nombre ${index + 1}",
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _itemsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyGroupListCard(
                                nombre: _itemsList[index],
                                onTap: () {
                                  setState(
                                    () {
                                      _tarjetaSeleccionada
                                          .add(_itemsList[index]);
                                      _itemsList.removeAt(index);
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
