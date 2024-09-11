import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/features/AccountCreationPage/presentation/pages/MyAccountCreationPage.dart';
import 'package:proyecto/features/MainPage/presentation/MyMainPage.dart';
import 'package:proyecto/features/ProfileCreation/presentation/MyProfileCreationPage.dart';
import 'package:proyecto/features/ProfileEdition/presentation/MyProfileEditiontionPage.dart';
import 'package:proyecto/features/ProfileSelection/presentation/MyProfileSelectionPage.dart';
import 'package:proyecto/provider/AuthProvider.dart';
import 'features/LectionTemplate/presentation/LeccionDemo.dart';
import 'features/LoginPage/presentation/pages/LoginPage.dart';
import 'features/LandingPage/presentation/LandingPage.dart';

void main() {
    runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/', 
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/leccion': (context) => const LeccionDemo(),
        '/accountCreation': (context) => const MyAccountCreationPage(),
        '/profileCreation': (context) => const MyProfileCreationPage(/*user: {}*/),
        '/profileEdition': (context) => const MyProfileEditionPage(),
        '/profileSelection': (context) => const MyProfileSelectionPage(),
        '/MainPage': (context) => const MyMainPage(), 
      },
      debugShowCheckedModeBanner: false,
    );
  }
}