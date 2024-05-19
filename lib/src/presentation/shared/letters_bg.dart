import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class LettersBG extends StatefulWidget {
  const LettersBG({super.key});

  @override
  State<LettersBG> createState() => _LettersBGState();
}

class _LettersBGState extends State<LettersBG> {
  final letters =
      'āăąδēėęěėęĺļľŀłńňņñøřŕŗřśŝşšťțабвгдеёжзийклмнопрстуфхцчшщъыьэюя';
  static const double minDistance = 64.0;

  List<PositionedLetter> positionedLetters = [];

  Timer? timer;

  BoxConstraints? constraints;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String get randomLetter {
    final random = Random();
    return letters[random.nextInt(letters.length)];
  }

  void generateLetters() {
    final random = Random();
    List<PositionedLetter> list = [];
    while (list.length < letters.length) {
      // Adjust the number for more or fewer letters
      final letter = randomLetter;

      bool placed = false;

      while (!placed) {
        final posX = random.nextDouble() * MediaQuery.of(context).size.width;
        final posY = random.nextDouble() * MediaQuery.of(context).size.height;

        if (isPositionValid(posX, posY, list)) {
          list.add(PositionedLetter(
            letter: letter,
            posX: posX,
            posY: posY,
          ));
          placed = true;
        }
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        positionedLetters = list;
      });
    });
  }

  bool isPositionValid(double x, double y, List<PositionedLetter> list) {
    for (var placedLetter in list) {
      double dx = placedLetter.posX - x;
      double dy = placedLetter.posY - y;
      double distance = sqrt(dx * dx + dy * dy);
      if (distance < minDistance) {
        return false;
      }
    }
    return true;
  }

  void replaceLetters() {
    final random = Random();

    for (int i = 0; i < 3; i++) {
      replaceLetter(random.nextInt(positionedLetters.length));
    }
  }

  void replaceLetter(int index) {
    final random = Random();
    positionedLetters[index] = PositionedLetter(
      letter: randomLetter,
      posX: random.nextDouble() * MediaQuery.of(context).size.width,
      posY: random.nextDouble() * MediaQuery.of(context).size.height,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  void setConstraints(BoxConstraints constraints) {
    if (this.constraints == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          this.constraints = constraints;
        });
      });

      generateLetters();

      timer = Timer.periodic(
        const Duration(milliseconds: 300),
        (Timer t) => replaceLetters(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        setConstraints(constrains);
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: positionedLetters
                .map((letter) => Positioned(
                      left: letter.posX,
                      top: letter.posY,
                      child: Text(
                        letter.letter,
                        style: const TextStyle(
                          fontSize: 20, // Adjust size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}

class PositionedLetter {
  final String letter;
  final double posX;
  final double posY;

  PositionedLetter({
    required this.letter,
    required this.posX,
    required this.posY,
  });
}
