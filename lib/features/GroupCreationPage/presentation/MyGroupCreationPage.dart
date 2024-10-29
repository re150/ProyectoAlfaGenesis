import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/core/models/Alumno.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'package:proyecto/provider/TeamProvider.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyGroupCard.dart';
import 'package:proyecto/widgets/MyTextField.dart';
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
  final List<String> _grados = ["A", "B", "C"];
  final List<Alumno> _alumnos = [];
  List<MyGroupCard?> _grupos = [];
  List<Alumno> alumnosTeam = []; 
   Map<String, String> teamOnDB = {};
  int _indexIndicado = -1;
  List<Alumno> _alumnosFiltrados = [];
  String? _gradoSeleccionado;
  List<dynamic> profiles = [];
  List<Map<String,dynamic>> teams = [];
  bool loading = false;
  List<dynamic> deserializedProfiles = [];

  Future<void> _deleteTeam(String id) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final response = await http.post(
      Uri.parse('http://$ipAdress:$port/next/alfa/teams/DeleteTeam'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken'
      },
      body: jsonEncode({
        'id': id,
      }),
    );

    if (response.statusCode == 200) {
      print('Equipo eliminado');
    } else {
      throw Exception('Error al eliminar el equipo');
    }
  }

  ///Funcion para borrar un grupo de la lista de grupos, toma como argumento el numero del grupo a borrar.
  ///
  ///Muestra un [AlertDialog] para que el usuario pueda confirmar si desea borrar un grupo.
  ///Si el usuario acepta, hace uso de la funcion de [setState] para actualizar la vista en tiempo real.
  ///Si el grupo no esta vacío, recorre a la lista de alumnos del grupo y les asigna el [teamState] como false.
  ///Despues manda a llamar la funcion [_filtrarAlumnos] para actualizar la vista en el [MyDropDownMenu].
  ///Y finalmente remueve el grupo de la lista de grupos.
  ///
  void _borrarGrupo(int numero) {
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
                  if (_grupos[numero - 1]!.lista.isNotEmpty) {
                    for (var alumno in _grupos[numero - 1]!.lista) {
                      _deleteAlumno(_grupos[numero - 1]!.id,alumno.id, alumno.name);
                      alumno.setTeamStatus(false);
                    }
                    _filtrarAlumnos(_gradoSeleccionado);
                  }
                  _deleteTeam(_grupos[numero - 1]!.id);
                  _grupos.removeAt(numero - 1);
                  for (int i = 0; i < _grupos.length; i++) {
                    _grupos[i] = MyGroupCard(
                      lista: _grupos[i]!.lista,
                      numeroGrupo: i + 1,
                      onUse: _grupos[i]!.onUse,
                      onDeleteGroup: () => _borrarGrupo(i + 1),
                      isSelected: _grupos[i]!.isSelected,
                      onSelect: () => _seleccionarGrupo(i + 1),
                      onDeleteAlumno: _grupos[i]!.onDeleteAlumno,
                      nombreGrupo: _grupos[i]!.nombreGrupo,
                      id: _grupos[i]!.id,
                    );
                  }
                  if (_indexIndicado >= _grupos.length) {
                    _indexIndicado = _grupos.length - 1;
                  }
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

  ///Función para usar el grupo seleccionado que se debe comunicar con el backend.
  ///Para que el grupo seleccionado sea el grupo activo en la aplicación
  ///
  void _usargrupo(String id) async {
     List<Alumno> listMembers = [];
     if(teamOnDB.isNotEmpty){
        if(teamOnDB.containsKey(id)){
            setState(() {
              _indexIndicado = _grupos.indexWhere((element) => element!.nombreGrupo == id);
              _seleccionarGrupo(_indexIndicado + 1);
              Provider.of<TeamProvider>(context, listen: false).setIdTeam(teamOnDB[id]!);
                Navigator.pushNamed(context, '/roadMap');
            });
        }else{
          for(var team in _grupos){
              if(team?.nombreGrupo == id){
                listMembers = team!.lista;
              }
          }
          creatTeam(id, listMembers);
        }
     }
  }

  Future<void> _loadGrupos() async { 
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final response = await http.get(
      Uri.parse('http://$ipAdress:$port/next/alfa/teams/showTeams'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken'
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<Map<String, dynamic>> jsonTeam = jsonResponse.cast<Map<String, dynamic>>();
        teams = jsonTeam;
        loading = false;
      });
      
    } else {
      throw Exception('Error al cargar perfiles');
    }
      _showGrupos(teams);
  }

  void _showGrupos(List<Map<String, dynamic>> teams){

      for (var team in teams) {
        String  nameTeam = team['nameTeam'];
        String teamId = team['id'];
        List<Map<String, dynamic>> members = (team['members'] as List<dynamic>)
        .map((item) => item as Map<String, dynamic>)
        .toList();
        List<Alumno> alumnosTeam = _parseProfilesToList(members);   
        int numero = _grupos.length + 1;

      _grupos.add(  //crear grupo 
           MyGroupCard(
            numeroGrupo: numero,
            lista: const [] ,
            onUse: () => _usargrupo(nameTeam),
            onDeleteGroup: () => _borrarGrupo(numero),
            isSelected: false,
            onSelect: () => _seleccionarGrupo(numero),
            onDeleteAlumno: (alumno) =>
            _quitarAlumnoDeGrupo(alumno),
            nombreGrupo: nameTeam,
            id: teamId,
            ),
        );
         _updateTeamMembers(alumnosTeam, nameTeam, numero);
         teamOnDB[nameTeam]= teamId;    
      }
      
  }
  
  void _updateTeamMembers(List<Alumno> alumnos, String name, int numTeam) {
    int groupIndex = numTeam - 1;

    for (var alumno in alumnos) {
      for (var i = 0; i < _alumnos.length; i++) {
        if (alumno.name == _alumnos[i].name && alumno.id == _alumnos[i].id && !_alumnos[i].teamStatus) {
          _alumnos[i].setTeamName(name);
          _alumnos[i].setTeamStatus(true);
          _agregarMembers(_alumnos[i], groupIndex);
        }
      }
    }
  }

  void _agregarMembers(Alumno alumno, int numTeam) {
      setState(() {
        if (_grupos[numTeam] != null) {
          _grupos[numTeam] = MyGroupCard(
            lista: [..._grupos[numTeam]!.lista, alumno],  
            numeroGrupo: _grupos[numTeam]!.numeroGrupo,
            onUse: _grupos[numTeam]!.onUse,
            onDeleteGroup: _grupos[numTeam]!.onDeleteGroup,
            isSelected: _grupos[numTeam]!.isSelected,
            onSelect: _grupos[numTeam]!.onSelect,
            onDeleteAlumno: _grupos[numTeam]!.onDeleteAlumno,
            nombreGrupo: _grupos[numTeam]!.nombreGrupo,
            id: _grupos[numTeam]!.id,
          );
        }
        _filtrarAlumnos(_gradoSeleccionado);
      });
  }

  Future<void> _deleteAlumno(String idTeam, String idUser, String name) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final response = await http.post(
      Uri.parse('http://$ipAdress:$port/next/alfa/teams/DeleteMember'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken'
      },
      body: jsonEncode({
        'id': idTeam,
        'idUser': idUser,
        'name': name,
      }),
    );

    if (response.statusCode == 200) {
      print('Miembro eliminado');
    } else {
      throw Exception('Error al eliminar el miembro');
    }
  }
  ///Función para quitar un alumno de un grupo, toma como argumento un alumno.
  ///
  ///Hace uso de la funcion de [setState] para actualizar la vista en tiempo real.
  ///Utiliza la variable [_indexIndicado] para saber que grupo se esta modificando,
  ///y busca al alumno en la lista de alumnos del grupo y lo remueve.
  ///
  void _quitarAlumnoDeGrupo(Alumno alumno) {
    setState(() {
      var grupo = _grupos[_indexIndicado];
      if (grupo != null && grupo.lista.contains(alumno)) {
        grupo.lista.remove(alumno);
        alumno.setTeamStatus(false);
        _grupos[_indexIndicado] = MyGroupCard(
          lista: grupo.lista,
          numeroGrupo: grupo.numeroGrupo,
          onUse: grupo.onUse,
          onDeleteGroup: grupo.onDeleteGroup,
          isSelected: grupo.isSelected,
          onSelect: grupo.onSelect,
          onDeleteAlumno: grupo.onDeleteAlumno,
          nombreGrupo: grupo.nombreGrupo,
          id: grupo.id,
        );
        _deleteAlumno(_grupos[_indexIndicado]!.id, alumno.id, alumno.name);
        _filtrarAlumnos(_gradoSeleccionado);
      }
    });
  }

  Future<void> _addAlumno(Alumno alumno, String idTeam, int teamSize) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final response = await http.post(
      Uri.parse('http://$ipAdress:$port/next/alfa/teams/AddMember'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken'
      },
      body: jsonEncode({
        'id': idTeam,
        'nom': teamSize,
        "grado":alumno.grado,
        "level":alumno.level,
        "stars":alumno.stars,
        "idUser":alumno.id,
        "grupo":alumno.grupo,
        "name": alumno.name,
        "imgUrl":alumno.imgUrl,
        "teamStatus":alumno.teamStatus
      }),
    );

    if (response.statusCode == 200) {
      print('Miembro Añaadido');
    } else {
      throw Exception('Error al Añaadido el miembro');
    }
  }
 
  ///Función para agregar un alumno a un grupo, toma como argumento un alumno.
  ///
  ///Hace uso de la funcion de [setState] para actualizar la vista en tiempo real.
  ///Utiliza la variable [_indexIndicado] para saber a que grupo se le va a añadir un alumno.
  ///Y redibuja los [MyGroupCard] de la lista con los mismos valores que tenian mas el nuevo [alumno].
  ///Si lo vez necesario, agrega la funcionalidad para comunnicarse con el [backend].
  ///
  void _agregarAlumnoAlGrupo(Alumno alumno ) {
    setState(() {
       _addAlumno(alumno, _grupos[_indexIndicado]!.id, _grupos[_indexIndicado]!.lista.length + 1);
      alumno.setTeamStatus(true);
      _grupos[_indexIndicado] = MyGroupCard(
        lista: [..._grupos[_indexIndicado]!.lista, alumno],
        numeroGrupo: _grupos[_indexIndicado]!.numeroGrupo,
        onUse: _grupos[_indexIndicado]!.onUse,
        onDeleteGroup: _grupos[_indexIndicado]!.onDeleteGroup,
        isSelected: _grupos[_indexIndicado]!.isSelected,
        onSelect: _grupos[_indexIndicado]!.onSelect,
        onDeleteAlumno: _grupos[_indexIndicado]!.onDeleteAlumno,
        nombreGrupo: _grupos[_indexIndicado]!.nombreGrupo,
        id: _grupos[_indexIndicado]!.id,
      );
     
      _filtrarAlumnos(_gradoSeleccionado);
    });
  }

  ///Función para seleccionar un grupo, toma como argumento el numero del grupo a seleccionar.
  ///
  ///Hace uso de la funcion de [setState] para actualizar la vista en tiempo real.
  ///Recorre la lista de grupos y cambia el valor de [isSelected] a false en todos los grupos.
  ///Excepto al grupo cuyo [numero] es igual al argumento de la función.
  ///
  void _seleccionarGrupo(int numero) {
    setState(() {
      _indexIndicado = numero - 1;
      _grupos = _grupos.map((grupo) {
        return MyGroupCard(
          lista: grupo!.lista,
          numeroGrupo: grupo.numeroGrupo,
          onUse: grupo.onUse,
          onDeleteGroup: grupo.onDeleteGroup,
          isSelected: grupo.numeroGrupo == numero,
          onSelect: grupo.onSelect,
          onDeleteAlumno: grupo.onDeleteAlumno,
          nombreGrupo: grupo.nombreGrupo,
          id: grupo.id,
        );
      }).toList();
    });
  }

  ///Función para crear un grupo, no requiere ningun argumento y regresa un void
  ///
  ///Asigna una variable [numero], que es igual al tamaño de {[_grupos] + 1} al parametro de [numero] del [MyGroupCard] que se va a crear.
  ///Muestra un [AlertDialog] para que el usuario pueda confirmar si desea crear un grupo.
  ///Si no es cancelado se manda a llamar a la función [_mostrarDialogoNombreGrupo]
  ///
  void _crearGrupo() {  
  
    int numero = _grupos.length + 1;
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
                Navigator.of(context).pop();
                _mostrarDialogoNombreGrupo(numero);
              },
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  ///Función para mostrar un dialogo para que el usuario pueda ingresar el nombre del grupo,
  ///Muestra un [AlertDialog] con un [MyTextField] para que el usuario pueda ingresar el nombre del grupo.
  ///
  ///Si el usuario acepta, se manda a llamar a la función [setState] para actualizar la vista en tiempo real.
  ///Se crea un nuevo [MyGroupCard] con los valores del grupo y se añade a la lista de [_grupos].
  ///Se recorre la lista de [_grupos] y se actualizan los valores de los [MyGroupCard] para evitar errores con los indices.
  ///Tambien se asegura de que el nombre no este vacío, si lo esta muestra un [AlertDialog] con un mensaje de error.
  ///

  void _mostrarDialogoNombreGrupo(int numero) {
    TextEditingController nombreController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Nombre del Grupo"),
          content: MyTextField(
            controller: nombreController,
            hintText: "Nombre del grupo",
            obscureText: false,
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                if (nombreController.text.isNotEmpty) {
                  setState(
                    () {
                      _indexIndicado = numero - 1;
                      _grupos.add(  //crear grupo 
                        MyGroupCard(
                          numeroGrupo: numero,
                          lista: const [],
                          onUse: () => _usargrupo(nombreController.text),
                          onDeleteGroup: () => _borrarGrupo(numero),
                          isSelected: false,
                          onSelect: () => _seleccionarGrupo(numero),
                          onDeleteAlumno: (alumno) =>
                              _quitarAlumnoDeGrupo(alumno),
                          nombreGrupo: nombreController.text,
                          id: '',
                        ),
                      );

                      for (int i = 0; i < _grupos.length; i++) {
                        _grupos[i] = MyGroupCard(
                          lista: _grupos[i]!.lista,
                          numeroGrupo: i + 1,
                          onUse: _grupos[i]!.onUse,
                          onDeleteGroup: () => _borrarGrupo(i + 1),
                          isSelected: _grupos[i]!.isSelected,
                          onSelect: () => _seleccionarGrupo(i + 1),
                          onDeleteAlumno: _grupos[i]!.onDeleteAlumno,
                          nombreGrupo: _grupos[i]!.nombreGrupo,
                          id: _grupos[i]!.id,
                        );
                      }
                    },
                  );
                  Navigator.of(context).pop();
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: const Text("El nombre del grupo no puede estar vacío"),
                        actions: [
                          TextButton(
                            onPressed: Navigator.of(context).pop,
                            child: const Text("Aceptar"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  ///Función para filtrar los alumnos, toma como argumento un [grupoFiltrado] de tipo [String]
  ///[grupoFiltrado] es el grupo a mostrar en la lista controlada por el [MyDropDownMenu].
  ///
  ///Checa si el grupo filtrado es nulo, aunque nunca deberia de pasar en teoria.
  ///Y si de alguna manera pasa, hice que se iguale a la lista normal de [_alumnos].
  ///
  ///Si no es nulo, se filtran los alumnos de la lista de [_alumnos] por [grupo] y si su [teamStatus] es false.
  ///
  void _filtrarAlumnos(String? grupoFiltrado) {
    setState(() {
        _alumnosFiltrados = _alumnos
         .where((alumno) => alumno.grupo == grupoFiltrado && !alumno.teamStatus)
        .toList();
    });
  }
 
  void _loadView(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyGroupCreationPage()),
      );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
      fetchProfiles().then((_) {
        _loadGrupos();
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<void> fetchProfiles() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final jwtToken = authProvider.jwtToken;
    final response = await http.get(
      Uri.parse('http://$ipAdress:$port/next/alfa/teams/ShowProfiles'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken'
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
        profiles = jsonData;
        parseProfiles(profiles);
        loading = false;
      });
      
    } else {
      throw Exception('Error al cargar perfiles');
    }
  }

  void parseProfiles(List<dynamic> profiles) {
  for (var profileString in profiles) {
    final matches = profileRegex.allMatches(profileString);
    for (var match in matches) {
      /// Se añade el alumno a la lista de alumnos
     _alumnos.add(Alumno.fromMap({
        'id': match.group(4)!,
        'name': match.group(6)!,
        'imgUrl': match.group(7)!,
        'grado': int.parse(match.group(1)!),
        'level': int.parse(match.group(2)!),
        'stars': int.parse(match.group(3)!),
        'grupo': match.group(5)!,
        'teamStatus': match.group(8) == 'null' ? null : match.group(7) == 'true'
      }));
    }
  }
}

  List<Alumno> _parseProfilesToList(List<Map<String, dynamic>> profiles) {
    List<Alumno> newList =[];
    for (var profile in profiles) {
      String id = profile['id'];
      String name = profile['name'];
      String imgUrl = profile['imgUrl'];
      int grado = profile['grado'];
      int level = profile['level'];
      int stars = profile['stars'];
      String grupo = profile['grupo'];
      bool? teamStatus = profile['teamStatus'] == 'null' ? null : profile['teamStatus'] == 'true';

      Alumno alumno = Alumno.fromMap({
        'id': id,
        'name': name,
        'imgUrl': imgUrl,
        'grado': grado,
        'level': level,
        'stars': stars,
        'grupo': grupo,
        'teamStatus': teamStatus,
      });
      newList.add(alumno);
    }
    return newList;
}

  Future<void> creatTeam(String nameTeam, List<Alumno> listProfile) async{
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final jwtToken = authProvider.jwtToken;

      final response = await http.post(
      Uri.parse('http://$ipAdress:$port/next/alfa/teams/CreateTeam'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken'
      },
      body:
          jsonEncode(creatJson(nameTeam, listProfile)),
      );
        
      if (response.statusCode == 200) {
          final teamProvider = Provider.of<TeamProvider>(context, listen: false); 
          teamProvider.setIdTeam(response.body);
          int index = _grupos.length;
            if(_grupos.length == 0){
              index = 0;
            } else {
              index = _grupos.length - 1;
            }
          _grupos[index] = MyGroupCard(
            lista: listProfile,
            numeroGrupo: _grupos.length,
            onUse: () => _usargrupo(nameTeam),
            onDeleteGroup: () => _borrarGrupo(_grupos.length),
            isSelected: false,
            onSelect: () => _seleccionarGrupo(_grupos.length),
            onDeleteAlumno: (alumno) => _quitarAlumnoDeGrupo(alumno),
            nombreGrupo: nameTeam,
            id: response.body,
          );
      } else {
          throw Exception('Error al crear equipo');
      }
      _loadView();
   }

  Map<String, dynamic> creatJson(String nameTeam, List<Alumno> listProfile) {
    Map<String, dynamic> jsonMap = {
      "nameTeam": nameTeam,
      "NomMembers": listProfile.length,
    };

    for (int i = 0; i < listProfile.length; i++) {
      jsonMap["member${i + 1}"] = {
        "id": listProfile[i].id,
        "name": listProfile[i].name,
        "imgUrl":listProfile[i].imgUrl,
        "grado": listProfile[i].grado,
        "level": listProfile[i].level,
        "stars": listProfile[i].stars,
        "grupo": listProfile[i].grupo,
        "teamStatus": listProfile[i].teamStatus
      };
      print(jsonMap);
    }
    return jsonMap;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
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
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.05,
                            ),
                            MyButton(
                              text: "Crear",
                              onTap: () => _crearGrupo(),
                              colorB: Colors.blue,
                              colorT: Colors.white,
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.05,
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
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
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
                                        _gradoSeleccionado =
                                            newValue; //El newValue es el grupo seleccionado con el menu
                                        _filtrarAlumnos(newValue);
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
                                        itemCount: _alumnosFiltrados.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MyGroupListCard(
                                              nombre:
                                                  _alumnosFiltrados[index].name,
                                              imgPath: _alumnosFiltrados[index]
                                                  .imgUrl,
                                              onTap: () {
                                                if (_indexIndicado != -1) {
                                                  _agregarAlumnoAlGrupo(
                                                      _alumnosFiltrados[index]);
                                                }
                                              },
                                              onLongPress: null,
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