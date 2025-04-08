import 'dart:async';

import 'package:flutter/material.dart';

class LetterByLetterText extends StatefulWidget {
  final String text;
  final Color textColor;

  const LetterByLetterText({
    super.key,
    required this.text,
    required this.textColor,
  });

  @override
  LetterByLetterTextState createState() => LetterByLetterTextState();
}

class LetterByLetterTextState extends State<LetterByLetterText> {

  String visibleText = "";
  int currentIndex = 0;
  Duration delay = Duration(milliseconds: 45);

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    Timer.periodic(delay, (timer) {
      if (currentIndex < widget.text.length) {
        setState(() {
          visibleText += widget.text[currentIndex];
          currentIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      visibleText,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w200,
        letterSpacing: 2,
        color: widget.textColor,
      ),
    );
  }
}

// class SlideInAnimationWidget extends StatefulWidget {
//   final Widget child;
//   final double height;

//   const SlideInAnimationWidget({
//     super.key,
//     required this.child,
//     this.height = 50,
//   });

//   @override
//   SlideInAnimationWidgetState createState() => SlideInAnimationWidgetState();
// }

// class SlideInAnimationWidgetState extends State<SlideInAnimationWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: Offset(-0.5, 0), // from left
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _fadeAnimation = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _slideAnimation,
//       child: FadeTransition(
//         opacity: _fadeAnimation,
//         child: widget.child,
//       ),
//     );
//   }
// }
