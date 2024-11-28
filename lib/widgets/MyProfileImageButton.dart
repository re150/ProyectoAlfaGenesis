import 'package:flutter/material.dart';
import 'package:proyecto/widgets/MyStarButton.dart';

class MyProfileImageButton extends StatefulWidget {
  final String imagepath;
  final bool isUnlocked;
  final bool isSelected;
  final VoidCallback onTap;
  final int puntos;
  const MyProfileImageButton({
    super.key,
    required this.imagepath,
    required this.isUnlocked,
    required this.isSelected,
    required this.onTap,
    required this.puntos,
  });

  @override
  State<MyProfileImageButton> createState() => _MyProfileImageButtonState();
}

class _MyProfileImageButtonState extends State<MyProfileImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: widget.isSelected ? Colors.blue : Colors.black,
            ),
            image: DecorationImage(
              image: AssetImage("assets/ProfilePictures/${widget.imagepath}"),
              fit: BoxFit.cover,
              colorFilter: widget.isUnlocked
                  ? null
                  : const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation,
                    ),
            ),
          ),
          child: !widget.isUnlocked
              ? Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyStar(correcto: true),
                        Text(
                          "${widget.puntos}",
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : null),
    );
  }
}
