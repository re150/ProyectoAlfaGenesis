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
  List<Widget?> _grupos = [];
  int _indexIndicado = 0;
  List<List<String>> _alumnoSeleccionado = [];
  List<String> _alumnos = List.generate(10, (index) => "Nombre ${index + 1}");
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

  void _crearGrupo(int numero) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Crear Grupo"),
          content: const Text("¿Seguro que deseas rear un grupo?"),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _indexIndicado = numero - 1;
                  _alumnoSeleccionado.add([]);
                  _grupos.add(
                    MyGroupCard(
                      numero: numero,
                      lista: _alumnoSeleccionado[numero - 1],
                      onTap: () {
                        setState(() {
                          _indexIndicado = numero - 1;
                        });
                      },
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  void _actualizarGrupo() {
    setState(() {
      _grupos[_indexIndicado] = MyGroupCard(
        numero: _indexIndicado + 1,
        lista: _alumnoSeleccionado[_indexIndicado],
        onTap: () {
          setState(() {
            _indexIndicado = _indexIndicado;
          });
        },
      );
    });
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                        onTap: () => _crearGrupo(_grupos.length + 1),
                        colorB: Colors.blue,
                        colorT: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _grupos.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _grupos[index]!,
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

          //LADO IZQUIERDO
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                  _alumnos = List.generate(
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
                                  itemCount: _alumnos.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MyGroupListCard(
                                        nombre: _alumnos[index],
                                        onTap: () {
                                          setState(
                                            () {
                                              _alumnoSeleccionado[
                                                      _indexIndicado]
                                                  .add(_alumnos[index]);
                                              _alumnos.removeAt(index);
                                              _actualizarGrupo();
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
