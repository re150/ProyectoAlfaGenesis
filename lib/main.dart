import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/provider/TeamProvider.dart';
import 'package:sqflite/sqflite.dart';
import 'config/theme/ThemeData.dart';
import 'core/resources/DataBaseHelper.dart';
import 'features/AccountCreationPage/presentation/pages/MyAccountCreationPage.dart';
import 'features/GroupCreationPage/presentation/MyGroupCreationPage.dart';
import 'features/LectionTemplate/presentation/LeccionDemo.dart';
import 'features/LoginPage/presentation/pages/LoginPage.dart';
import 'features/LandingPage/presentation/LandingPage.dart';
import 'features/MainPage/presentation/MyMainPage.dart';
import 'features/ProfileCreation/presentation/MyProfileCreationPage.dart';
import 'features/ProfileEdition/presentation/MyProfileEditiontionPage.dart';
import 'features/ProfileSelection/presentation/MyProfileSelectionPage.dart';
import 'features/RoadMap/presentation/MyRoadMapView.dart';
import 'provider/AuthProvider.dart';
import 'provider/ProfileProvider.dart';
//ARREGLAR BUG CUANDO SE APAGA LA PANTALLA

void main() {
    runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => TeamProvider()),
      ],
      child:  const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _inicializarDB () async {
    DatabaseHelper dbHelper = DatabaseHelper();
    //dbHelper.deleteDB();
    dbHelper.initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    
    _inicializarDB();
    return MaterialApp(
      theme: theme,
      initialRoute: '/', 
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/leccion': (context) => const LeccionDemo(),
        '/roadMap': (context) => const MyRoadMapView(),
        '/accountCreation': (context) => const MyAccountCreationPage(),
        '/profileCreation': (context) => const MyProfileCreationPage(),
        '/profileEdition': (context) => const MyProfileEditionPage(),
        '/profileSelection': (context) => const MyProfileSelectionPage(),
        '/MainPage': (context) => const MyMainPage(), 
        '/GroupCreationPage': (context) => const MyGroupCreationPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}