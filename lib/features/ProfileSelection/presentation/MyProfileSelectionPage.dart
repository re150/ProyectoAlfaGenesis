import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto/features/ProfileSelection/widgets/MyProfileImage.dart';

class MyProfileSelectionPage extends StatefulWidget {
  const MyProfileSelectionPage({super.key});

  @override
  State<MyProfileSelectionPage> createState() => _MyProfileSelectionPageState();
}

class _MyProfileSelectionPageState extends State<MyProfileSelectionPage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
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

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Column(
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
                        onTap: null,
                        padding: const EdgeInsets.all(20),  
                        itemExtent: MediaQuery.of(context).size.width/3,
                        itemSnapping: false, 
                        children: List.generate(6, (index) => MyProfileImage()),
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