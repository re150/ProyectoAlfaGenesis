import 'package:flutter/material.dart';

class MyStar extends StatefulWidget {
  final double? size;
  final bool correcto;
  const MyStar({super.key, this.size = 25, required this.correcto});

  @override
  State<MyStar> createState() => _MyStarState();
}

class _MyStarState extends State<MyStar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.black,
              size: widget.size! + widget.size! * 0.1,
            ),
            if (widget.correcto)
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      _controller.value - 0.3,
                      _controller.value,
                      _controller.value + 0.3,
                    ],
                    colors: [
                      Colors.yellow,
                      Colors.white.withOpacity(0.8),
                      Colors.yellow,
                    ],
                  ).createShader(rect);
                },
                blendMode: BlendMode.srcATop,
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: widget.size,
                ),
              ),
          ],
        );
      },
    );
  }
}
