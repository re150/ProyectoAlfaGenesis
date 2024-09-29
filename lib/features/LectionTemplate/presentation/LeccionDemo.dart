import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../core/resources/DataBaseHelper.dart';
import 'LeccionBeach.dart';
import 'LeccionBricks.dart';
import 'LeccionBubbles.dart';
import 'LeccionSky.dart';

class LeccionDemo extends StatefulWidget {
  const LeccionDemo({super.key});

  @override
  State<LeccionDemo> createState() => _LeccionDemoState();
}

class _LeccionDemoState extends State<LeccionDemo> {
  
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final Map<int, List<Map<String, dynamic>>> _etapasPorLeccion = {};
  final Map<int, List<Map<String, dynamic>>> _materialesPorEtapa = {};
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Map<String, dynamic>> _lecciones = [];
  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final Database db = await _dbHelper.database;
    _lecciones = await db.query('lecciones');

    for (var leccion in _lecciones) {
      int leccionId = leccion['id'];
      List<Map<String, dynamic>> etapas = await db.query(
        'etapa',
        where: 'id_leccion = ?',
        whereArgs: [leccionId],
      );
      _etapasPorLeccion[leccionId] = etapas;

      for (var etapa in etapas) {
        int etapaId = etapa['id'];
        List<Map<String, dynamic>> materiales = await db.query(
          'material',
          where: 'id_etapa = ?',
          whereArgs: [etapaId],
        );
        _materialesPorEtapa[etapaId] = materiales;
      }
    }
    setState(() {
      dataLoaded = true;
    });
  }

  void _nextPage() {
    if (_currentPage < _pageController.page!.toInt() + 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildEtapa(Map<String, dynamic> etapa) {
    String leccionTipo = etapa['leccion_tipo'] ?? 'unknown';
    int etapaId = etapa['id'];
    List<Map<String, dynamic>> materiales = _materialesPorEtapa[etapaId] ?? [];
    String titulo = _lecciones[0]["titulo"] as String;
    String instrucciones = etapa['instrucciones'] as String;

    switch (leccionTipo) {
      case "blocks":
        return LeccionBricks(
          materiales: materiales,
          titulo: titulo,
          onNext: _nextPage,
          instrucciones: instrucciones,
        );
      case "bubbles":
        return LeccionBubbles();
      case "beach":
        return LeccionBeach();
      case "sky":
        return LeccionSky();
      default:
        return const Text("ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!dataLoaded) {
      return const Center(child: CircularProgressIndicator());
    }

    int leccionId = _lecciones[0]['id'];
    List<Map<String, dynamic>> etapas = _etapasPorLeccion[leccionId] ?? [];

    return Scaffold(
      body: etapas.isNotEmpty
          ? PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: etapas.length,
              itemBuilder: (context, index) {
                _currentPage = index;
                return _buildEtapa(etapas[index]);
              },
            )
          : const Center(child: Text("SI VES ESTO NO TENGO IDEA DE QUE PASÓ")),
    );
  }
}