import 'dart:math';

import 'package:flutter/material.dart';

class SingleImage360Viewer extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final Color backgroundColor;
  final bool autoRotate;
  final Duration rotationSpeed;

  const SingleImage360Viewer({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.grey,
    this.autoRotate = false,
    this.rotationSpeed = const Duration(milliseconds: 30),
  });

  @override
  State<SingleImage360Viewer> createState() => _SingleImage360ViewerState();
}

class _SingleImage360ViewerState extends State<SingleImage360Viewer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotation = 0.0;
  double _scale = 1.0;
  Offset? _previousOffset;
  bool _isRotating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.rotationSpeed,
    )..addListener(_handleAutoRotation);

    if (widget.autoRotate) {
      _startAutoRotation();
    }
  }

  void _handleAutoRotation() {
    if (_isRotating) {
      setState(() {
        // Rotate in the correct direction (clockwise)
        _rotation -= 0.01;
        if (_rotation < -2 * pi) _rotation += 2 * pi;
      });
    }
  }

  void _startAutoRotation() {
    _isRotating = true;
    _controller.repeat();
  }

  void _stopAutoRotation() {
    _isRotating = false;
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _previousOffset = details.focalPoint;
        if (widget.autoRotate) {
          _stopAutoRotation();
        }
      },
      onScaleUpdate: (details) {
        if (_previousOffset != null) {
          final delta = details.focalPoint.dx - _previousOffset!.dx;
          setState(() {
            // Rotate in the correct direction based on finger movement
            _rotation -= delta * 0.01;
            _scale = details.scale.clamp(0.8, 2.0);
          });
        }
        _previousOffset = details.focalPoint;
      },
      onScaleEnd: (_) {
        _previousOffset = null;
        if (widget.autoRotate) {
          _startAutoRotation();
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        color: widget.backgroundColor,
        child: Transform.scale(
          scale: _scale,
          child: Transform.rotate(
            angle: _rotation,
            child: Image.asset(widget.imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
