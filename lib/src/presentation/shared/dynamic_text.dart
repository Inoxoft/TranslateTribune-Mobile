import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DynamicText extends StatefulWidget {
  const DynamicText(
    this.text, {
    required this.stringToReplace,
    required this.duration,
    required this.animationDuration,
    required this.style,
    required this.textAlign,
    super.key,
  });

  final String text;
  final String stringToReplace;
  final Duration duration;
  final Duration animationDuration;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  State<DynamicText> createState() => _DynamicTextState();
}

class _DynamicTextState extends State<DynamicText> {
  late String displayedText;
  late String chars;
  late List<int> animatingIndices;

  Random random = Random();

  @override
  void initState() {
    super.initState();
    displayedText = widget.text;
    chars = widget.stringToReplace;
    animatingIndices = [];
    animateText();
  }

  void animateText() {
    Timer.periodic(
      widget.duration,
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        setState(() {
          final textContent = displayedText;
          int index;
          do {
            index = random.nextInt(textContent.length);
          } while (animatingIndices.contains(index) ||
              !RegExp(r'[a-zA-Z]').hasMatch(textContent[index]));

          animatingIndices.add(index);
          // final char = textContent[index];
          final newChar = chars[random.nextInt(chars.length)];
          displayedText = textContent.substring(0, index) +
              newChar +
              textContent.substring(index + 1);

          Future.delayed(
            widget.duration,
            () {
              if (mounted) {
                setState(() {
                  displayedText = displayedText.substring(0, index) +
                      widget.text[index] +
                      displayedText.substring(index + 1);
                  animatingIndices.remove(index);
                });
              }
            },
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayedText,
      style: widget.style,
      textAlign: widget.textAlign,
    );
  }
}
