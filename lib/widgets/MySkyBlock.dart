import 'package:flutter/material.dart';

class MySkyblock extends StatefulWidget {
  final dynamic content;
  final bool isSelected;
  final VoidCallback onTap;

  const MySkyblock({
    super.key,
    required this.content,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<MySkyblock> createState() => _MySkyblockState();
}

class _MySkyblockState extends State<MySkyblock> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: widget.isSelected ? Colors.white : Colors.white.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: widget.content,
      ),
    );
  }
}
