import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class LeccionDemo extends StatefulWidget {
  const LeccionDemo({
    super.key,
  });

  @override
  State<LeccionDemo> createState() => _LeccionDemoState();
}

class _LeccionDemoState extends State<LeccionDemo> {
  Map<String, dynamic> jsonData = {};

  @override
  void initState() {
    super.initState();
   _cargarJSON();
  }

  Future<void> _cargarJSON() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/lessonsContent.json');
      jsonData = json.decode(jsonString);
      print(jsonData);

    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget leccion = ModalRoute.of(context)!.settings.arguments as Widget;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: leccion,
              ),
            ),
          ],
        ),
      ),
    );
  }
}