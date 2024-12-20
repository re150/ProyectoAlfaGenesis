import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/core/resources/musica_fondo.dart';
import 'package:sqflite/sqflite.dart';
import '../../../core/resources/DataBaseHelper.dart';
import 'LeccionBeach.dart';
import 'LeccionBricks.dart';
import 'LeccionBubbles.dart';
import 'LeccionSky.dart';

class LeccionDemo extends StatefulWidget {
  final Map<String, dynamic> leccion;
  const LeccionDemo({super.key, this.leccion = const {}});

  @override
  State<LeccionDemo> createState() => _LeccionDemoState();
}

class _LeccionDemoState extends State<LeccionDemo> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final Map<int, List<Map<String, dynamic>>> _materialesPorEtapa = {};
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Map<String, dynamic>> _etapas = [];
  bool dataLoaded = false;

  void _setOrientacion() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  Future<void> _loadData() async {
    final Database db = await _dbHelper.database;
    int leccionId = widget.leccion['id'];
    _etapas = await db.query(
      'etapa',
      where: 'id_leccion = ?',
      whereArgs: [leccionId],
    );

    for (var etapa in _etapas) {
      int etapaId = etapa['id'];
      List<Map<String, dynamic>> materiales = await db.query(
        'material',
        where: 'id_etapa = ?',
        whereArgs: [etapaId],
      );
      _materialesPorEtapa[etapaId] = materiales;
    }
    setState(() {
      dataLoaded = true;
    });
  }

  void _nextPage() {
    if (_currentPage == _etapas.length - 1) {
      MusicaFondo().continuarMusica();
      Navigator.of(context).pop();
    } else {
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
    String titulo = widget.leccion["titulo"] as String;
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
        return LeccionBubbles(
          materiales: materiales,
          titulo: titulo,
          onNext: _nextPage,
          instrucciones: instrucciones,
        );
      case "beach":
        return LeccionBeach(
          materiales: materiales,
          titulo: titulo,
          instrucciones: instrucciones,
          onNext: _nextPage,
        );
      case "sky":
        return LeccionSky(
          materiales: materiales,
          titulo: titulo,
          instrucciones: instrucciones,
          onNext: _nextPage,
        );
      default:
        return const Text("ERROR");
    }
  }

  @override
  void initState() {
    super.initState();
    MusicaFondo().detenerMusica();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
    _setOrientacion();
    _loadData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!dataLoaded) {
      return const Center(child: CircularProgressIndicator());
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: _etapas.isNotEmpty
            ? PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _etapas.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                  if (index == _etapas.length) {
                    _nextPage();
                  }
                },
                itemBuilder: (context, index) {
                  return _buildEtapa(_etapas[index]);
                },
              )
            : const Center(child: Text("ERROR, MATERIALES VACIOS")),
      ),
    );
  }
}
