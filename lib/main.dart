import 'package:flutter/material.dart';
import 'package:proyecto/features/AccountCreationPage/presentation/pages/MyAccountCreationPage.dart';
import 'package:proyecto/features/ProfileCreation/presentation/MyProfileCreationPage.dart';
import 'package:proyecto/features/ProfileSelection/presentation/MyProfileSelectiontionPage.dart';
import 'features/LectionTemplate/presentation/LeccionDemo.dart';
import 'features/LoginPage/presentation/pages/LoginPage.dart';
import 'features/LandingPage/presentation/LandingPage.dart';

void main() {
    runApp(const MyApp());
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
        '/leccion': (context) => LeccionDemo(),
        '/accountCreation': (context) => const MyAccountCreationPage(),
        '/profileCreation': (context) => MyProfileCreationPage(user: {},),
        '/profileSelection': (context) => const MyProfileSelectionPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
