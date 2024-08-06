import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeccionBricks extends StatefulWidget {
  final String backgroundImage;

  const LeccionBricks({
    super.key, 
    required this.backgroundImage,
  });

  @override
  State<LeccionBricks> createState() => _LeccionBricksState();
}

class _LeccionBricksState extends State<LeccionBricks> {

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];

  List<String> correctOrder = ['red', 'green', 'blue'];
  List<String?> draggedOrder = [null, null, null];
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            widget.backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        Column(
        children: <Widget>[  
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: colors.map((color){
                return Draggable<String>(
                  data: _getStringFromColor(color),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: color.withOpacity(0.5),
                  ),
                  childWhenDragging: Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                  ),
                   child: draggedOrder.contains(_getStringFromColor(color))
                   ?
                   Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                   )
                   :
                   
                   Container(
                    width: 100,
                    height: 100,
                    color: color
                   ),
                
                );
              }).toList(),
            ),
          ),

          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(colors.length, (index) {
                return DragTarget<String>(
                  onAccept: (receivedItem){
                    setState(() {
                      draggedOrder[index] = receivedItem;
                    });
                  },
                  builder: (context, acceptedItems, rejectedData) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey.withOpacity(0.8),
                      child: draggedOrder[index] != null ? 
                        Container(
                          width: 100,
                          height: 100,
                          color: _getColorFromString(draggedOrder[index]!),
                        )
                        : Container(),
                            );
                  },
                );
              }),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              bool isCorerct = true;
              for(int i = 0; i<correctOrder.length; i++){
                if(draggedOrder[i] != correctOrder[i]){
                  isCorerct = false;
                  break;
                }
              }
              if(isCorerct){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Correcto'))
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Incorrecto'))
                );
              }
            },
            child: const Text('Verificar'),
          ),
        ],
      ),
      ]
    );
  }

   Color _getColorFromString(String colorString) {
    switch (colorString) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }

   String _getStringFromColor(Color color) {
    String value = '';

    if (color == Colors.red) value = 'red';
    if (color == Colors.green) value = 'green';
    if (color == Colors.blue) value = 'blue';

    return value;
  }
}