import 'dart:math';

import 'package:flutter/material.dart';

class SpinningTextScreen extends StatefulWidget {
  const SpinningTextScreen({super.key});

  @override
  SpinningTextScreenState createState() => SpinningTextScreenState();
}

class SpinningTextScreenState extends State<SpinningTextScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

  final double radius = 100; // radius of the circle

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(); // infinite rotation

    _angleAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _angleAnimation,
          builder: (context, child) {
            double angle = _angleAnimation.value;
            double x = radius * cos(angle);
            double y = radius * sin(angle);
            return Transform.translate(
              offset: Offset(x, y),
              child: Text(
                'Spinning Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}