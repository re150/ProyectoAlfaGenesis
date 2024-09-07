import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/core/resources/constants.dart';
import 'package:proyecto/widgets/MyProfileImage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:proyecto/provider/AuthProvider.dart';

class MyProfileSelectionPage extends StatefulWidget {
  const MyProfileSelectionPage({super.key});

  @override
  State<MyProfileSelectionPage> createState() => _MyProfileSelectionPageState();
}

class _MyProfileSelectionPageState extends State<MyProfileSelectionPage> {
  List<dynamic> profiles = [];
   bool loading = true;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    fetchProfiles();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

   Future<void> fetchProfiles() async {
     final authProvider = Provider.of<AuthProvider>(context, listen: false);
    // Acceder al JWT token
    final jwtToken = authProvider.jwtToken;
    final email = authProvider.email;
  
     final response = await http.get(
      Uri.parse('http://$ipAdress:$port/next/alfa/showProfile/$email'),
      headers: <String, String>{
        'Authorization': 'Bearer $jwtToken'
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
         profiles = jsonData;
        loading = false;
      });
      
    } else {
      throw Exception('Error al cargar perfiles');
    }
  }

  @override
  Widget build(BuildContext context) {
  
  return Scaffold(
    body: SafeArea(
      child:  loading
            ? Center(child: CircularProgressIndicator())
            : Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/OceanBG.jpg'),
                            fit: BoxFit.cover,)
                        ),
                      ),
                      Center(child: Image.asset('assets/logoo.png')),

                       Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 40,),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: CarouselView(
                        elevation: 2,
                        onTap: (_) {
                          Navigator.pushNamed(context, '/MainPage');
                        },
                        padding: const EdgeInsets.all(20),  
                        itemExtent: MediaQuery.of(context).size.width/3,
                        itemSnapping: false, 
                        children: [
                                for (var profile in profiles)
                                  MyProfileImage(
                                    name: profile['name']!,
                                    imagePath: profile['imgUrl']!,
                                  ),
                              ],
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}