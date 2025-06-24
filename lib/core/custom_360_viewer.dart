import 'dart:math' as math;
import 'package:flutter/material.dart';

class Fake3DSingleImageSpin extends StatefulWidget {
  final String imagePath;
  final double size;

  const Fake3DSingleImageSpin({
    super.key,
    required this.imagePath,
    this.size = 300,
  });

  @override
  State<Fake3DSingleImageSpin> createState() => _Fake3DSingleImageSpinState();
}

class _Fake3DSingleImageSpinState extends State<Fake3DSingleImageSpin>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true); // bounce back and forth
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Matrix4 _buildMatrix(double value) {
    final angle = (value * 2 - 1) * (math.pi / 6); // -30 to +30 degrees
    return Matrix4.identity()
      ..setEntry(3, 2, 0.0015) // perspective
      ..rotateY(angle);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Transform(
            alignment: Alignment.center,
            transform: _buildMatrix(_controller.value),
            child: Image.asset(
              widget.imagePath,
              width: widget.size,
              height: widget.size,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
