import 'package:flutter/material.dart';

class LeccionDemo extends StatelessWidget {
  const LeccionDemo({
    super.key,
  });

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
