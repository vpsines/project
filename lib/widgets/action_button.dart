import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Color borderColor;
  final double size;
  final VoidCallback onPressed;

  const ActionButton({
    super.key, 
    required this.icon,
    required this.borderColor,
    required this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.1),
          borderRadius: BorderRadius.zero, // optional: make it square with rounded corners
        ),
        child: Center(
          child: Icon(
            icon,
            color: borderColor,
          ),
        ),
      ),
    );
  }
}