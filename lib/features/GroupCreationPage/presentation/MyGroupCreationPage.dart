import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/core/models/Alumno.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/TeamProvider.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyGroupCard.dart';
import '../../../widgets/MyDropDownMenu.dart';
import '../../../widgets/MyGroupListCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyGroupCreationPage extends StatefulWidget {
  const MyGroupCreationPage({super.key});

  @override
  State<MyGroupCreationPage> createState() => _MyGroupCreationPageState();
}

class _MyGroupCreationPageState extends State<MyGroupCreationPage> {
  final profileRegex = RegExp(
    r'Profile\(grado=(\d+), level=(\d+), stars=(\d+), id=([^,]+), grupo=([A-Z]), name=([^,]+), imgUrl=([^,]+), teamStatus=([^\)]+)\)',
  );
  final List<String> _grados = ["1A", "1B", "1C"];
  final List<Widget?> _grupos = [];
  int _indexIndicado = -1;
  final List<List<String>> _alumnoSeleccionado = [];
  final List<List<String>> _alumnoSeleccionadoImg = [];
  List<String> _alumnos = [];
  List<String> _alumnosId = [];
  List<String> _alumnosImg = [];
  List<Alumno> _alumnosA = [];
  String? _gradoSeleccionado;
  List<dynamic> profiles = [];
  bool loading = true;
  List<dynamic> deserializedProfiles = [];
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    fetchProfiles();
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

 Future<void> fetchProfiles() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final response = await http.get(
      Uri.parse('http://$ipAdress:$port/next/alfa/teams/ShowAll'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken'
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
        profiles = jsonData;
        //print(deserializedProfiles);
        loading = false;
      });
      
    } else {
      throw Exception('Error al cargar perfiles');
    }
  }


 List<Map<String, dynamic>> parseProfiles(List<dynamic> profiles) {
  List<Map<String, dynamic>> parsedProfiles = [];

  for (var profileString in profiles) {
    final matches = profileRegex.allMatches(profileString);
    for (var match in matches) {

      /// Se añade el alumno a la lista de alumnos
     _alumnosA.add(Alumno.fromMap({
        'id': match.group(4)!,
        'name': match.group(6)!,
        'imgUrl': match.group(7)!,
        'grado': int.parse(match.group(1)!),
        'level': int.parse(match.group(2)!),
        'stars': int.parse(match.group(3)!),
        'grupo': match.group(5)!,
        'teamStatus': match.group(8) == 'null' ? null : match.group(7) == 'true'
      }));

      parsedProfiles.add({
        'level': int.parse(match.group(2)!),
        'grupoAndgrado': '${match.group(1)}${match.group(5)}', // Concatenar grado y grupo
        'name': match.group(6)!,
        'imgUrl': match.group(7)!,
        'id': match.group(4)!,
        'stars': int.parse(match.group(3)!),
        'teamStatus': match.group(8) == 'null' ? null : match.group(7) == 'true'
      });
    }
  }
  return parsedProfiles;
}

void showAlumnos(List<Alumno> alumnos) {
  for (var profile in _alumnosA) {
        print(profile.name);
        print(profile.imgUrl);
        print(profile.grado);
        print(profile.level);
        print(profile.stars);
        print(profile.grupo);
        print(profile.teamStatus);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
            ? Center(child: const CircularProgressIndicator())
            : Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
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
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                                  // Parsear y filtrar los perfiles
                                  List<Map<String, dynamic>> parsedProfiles = parseProfiles(profiles);
                                   showAlumnos(_alumnosA);
                                  _alumnos = parsedProfiles
                                      .where((element) => element['grupoAndgrado'] == newValue)
                                      .map((e) => e['name'])
                                      .toList()
                                      .cast<String>();
                                  _alumnosId = parsedProfiles
                                      .where((element) => element['grupoAndgrado'] == newValue)
                                      .map((e) => e['id'])
                                      .toList()
                                      .cast<String>();

                                  _alumnosImg = parsedProfiles
                                      .where((element) => element['grupoAndgrado'] == newValue)
                                      .map((e) => e['imgUrl'])
                                      .toList()
                                      .cast<String>();
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
                                        imgPath: _alumnosImg[index],
                                        onTap: () {
                                          setState(
                                            () {
                                              if (_indexIndicado != -1) {
                                                _alumnoSeleccionado[_indexIndicado]
                                                    .add(_alumnos[index]);
                                                _alumnoSeleccionadoImg[_indexIndicado]
                                                    .add(_alumnosImg[index]);
                                                _alumnos.removeAt(index);
                                                _alumnosImg.removeAt(index);
                                                _actualizarGrupo();
                                              }
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
  
  void _crearGrupo(int numero) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Crear Grupo"),
          content: const Text("¿Seguro que deseas crear un grupo?"),
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
                  _alumnoSeleccionadoImg.add([]);
                  _grupos.add(
                    MyGroupCard(
                      numero: numero,
                      lista: _alumnoSeleccionado[numero - 1],
                      listId: _alumnosId,
                      listImg: _alumnoSeleccionadoImg[numero - 1],
                      onUse: () {
                        setState(() {
                          _indexIndicado = numero - 1;
                          _actualizarSeleccion();
                        });
                      },
                      onDelete: () => _borrarAlumnos(numero - 1),
                      isSelected: false,
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
        listId: _alumnosId,
        listImg: _alumnoSeleccionadoImg[_indexIndicado],
        onUse: () {
          setState(() {
            _indexIndicado = _indexIndicado;
            _actualizarSeleccion();
          });
        },
        onDelete: () => _borrarAlumnos(_indexIndicado),
        isSelected: true,
      );
    });
  }

  void _borrarAlumnos(int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Borrar Grupo"),
        content: const Text("¿Seguro que deseas borrar el grupo?"),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                List<String> alumnosDelGrupo = _alumnoSeleccionado[index];
                List<String> alumnosDelGrupoImg = _alumnoSeleccionadoImg[index];
                _alumnoSeleccionado.removeAt(index);
                _alumnoSeleccionadoImg.removeAt(index);
                _grupos.removeAt(index);
                _alumnos.addAll(alumnosDelGrupo);
                _alumnosImg.addAll(alumnosDelGrupoImg);
                _alumnos.sort();
                _alumnosImg.sort();
                _indexIndicado = -1;
                _actualizarSeleccion();
              });
              Navigator.of(context).pop();
            },
            child: const Text("Aceptar"),
          )
        ],
      );
    },
  );
}

  void _actualizarSeleccion() {
    setState(() {
      for (int i = 0; i < _grupos.length; i++) {
        _grupos[i] = MyGroupCard(
          numero: i + 1,
          lista: _alumnoSeleccionado[i],
          listId: _alumnosId,
          listImg: _alumnoSeleccionadoImg[i],
          onUse: () {
            setState(() {
              _indexIndicado = i;
              _actualizarSeleccion();
            });
          },
          onDelete: () => _borrarAlumnos(i),
          isSelected: _indexIndicado == i,
        );
      }
    });
  }
}
