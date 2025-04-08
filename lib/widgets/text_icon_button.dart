import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  final VoidCallback onPressed;
  final Color? buttonColor;

  const TextIconButton({
    super.key,
    required this.buttonText,
    required this.iconData,
    required this.onPressed,
    this.buttonColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Icon(iconData, color: buttonColor),
          SizedBox(width: 10),
          Text(
            buttonText.toUpperCase(),
            style: TextStyle(color: buttonColor, fontWeight: FontWeight.w600, letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}
