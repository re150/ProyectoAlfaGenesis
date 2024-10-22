import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyRespuesta.dart';

class Checador {
  Future<void> checarRespuesta(BuildContext context, bool esCorrecto) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Respuesta(esCorrecto: esCorrecto),
        );
      },
    );
  }
}
