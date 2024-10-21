import 'package:flutter/material.dart';
import 'package:proyecto/core/models/Alumno.dart';
import 'package:proyecto/widgets/MyButton.dart';
import 'package:proyecto/widgets/MyGroupListCard.dart';

class MyGroupCard extends StatefulWidget {
  final void Function()? onUse;
  final void Function()? onDeleteGroup;
  final Function(Alumno)? onDeleteAlumno;
  final void Function()? onSelect;
  final int numeroGrupo;
  final bool isSelected;
  final List<Alumno> lista;
  final String nombreGrupo;
  final String id;
  ///Este widget se encarga de mostrar un grupo de alumnos en una tarjeta de manera ordenada y agradable a la vista
  ///
  ///## Importante:
  ///[onUse] deberia de settear el grupo actual como el grupo usado para el resto de la aplicación
  ///
  ///[onDeleteGroup] se encarga de borrar el grupo seleccionado, y deberia regresar sus alumnos a la lista comunal
  ///
  ///[lista] es la lista de alumnos que pertenecen a este grupo, compuesta por miembros de la clase [Alumno]

  const MyGroupCard({
    super.key,
    required this.lista,
    required this.numeroGrupo,
    required this.onUse,
    this.isSelected = false,
    required this.onDeleteGroup,
    required this.onDeleteAlumno,
    required this.onSelect,
    required this.nombreGrupo,
    required this.id,
  });

  @override
  State<MyGroupCard> createState() => _MyGroupCardState();
}

class _MyGroupCardState extends State<MyGroupCard> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant MyGroupCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      setState(() {
        _isSelected = widget.isSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.7,
        width: MediaQuery.sizeOf(context).width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
          border: _isSelected ? Border.all(color: Colors.blue, width: 2) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 2),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IntrinsicWidth(
                      child: IntrinsicHeight(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                widget.nombreGrupo,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    itemCount: widget.lista.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyGroupListCard(
                            nombre: widget.lista[index].name,
                            imgPath: widget.lista[index].imgUrl,
                            onTap: null,
                            onLongPress: widget.onDeleteAlumno == null
                                ? null
                                : () => widget.onDeleteAlumno!(widget.lista[index])),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    text: "Usar",
                    onTap: widget.onUse,
                    colorB: Colors.blue,
                    colorT: Colors.white,
                  ),
                  MyButton(
                    text: "Borrar",
                    onTap: widget.onDeleteGroup,
                    colorB: Colors.red,
                    colorT: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

