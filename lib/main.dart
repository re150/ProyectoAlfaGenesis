import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/LectionTemplate/presentation/LeccionDemo.dart';
import 'features/LoginPage/presentation/pages/LoginPage.dart';
import 'features/LandingPage/presentation/LandingPage.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login', 
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/leccion': (context) => const LeccionDemo(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
