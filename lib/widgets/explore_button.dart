import 'dart:math';

import 'package:flutter/material.dart';

class CircularTextRunner extends StatefulWidget {
  final String text;
  final double size;
  final TextStyle textStyle;
  final Widget buttonChild;
  final Color buttonColor;

  const CircularTextRunner({
    required this.text,
    required this.size,
    required this.textStyle,
    required this.buttonChild,
    required this.buttonColor,
  });

  @override
  State<CircularTextRunner> createState() => _CircularTextRunnerState();
}

class _CircularTextRunnerState extends State<CircularTextRunner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(); // Continuous loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildRunningLetters(double radius, double rotation) {
    final letters = widget.text.split('');
    final anglePerLetter = (2 * pi) / letters.length;

    return List.generate(letters.length, (i) {
      final angle = anglePerLetter * i + rotation;
      final offsetX = radius * cos(angle);
      final offsetY = radius * sin(angle);

      return Positioned(
        left: radius + offsetX - 8,
        top: radius + offsetY - 8,
        child: Transform.rotate(
          angle: angle + pi / 2,
          child: Text(
            letters[i],
            style: widget.textStyle,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double radius = widget.size / 2;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final rotation = _controller.value * 2 * pi;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Running text around circle
            SizedBox(
              width: widget.size,
              height: widget.size,
              child: Stack(
                children: _buildRunningLetters(radius, rotation),
              ),
            ),

            // Circular button in center
            Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.buttonColor,
              ),
              child: Center(child: widget.buttonChild),
            ),
          ],
        );
      },
    );
  }
}