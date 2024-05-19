import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText(
    this.text, {
    required this.duration,
    required this.textKey,
    required this.style,
    this.textAlign,
    super.key,
  });

  final String text;
  final String textKey;
  final Duration duration;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Text(
        text,
        key: ValueKey<String>(
          textKey,
        ),
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}
