import 'package:flutter/material.dart';
import 'package:translatetribune/src/presentation/shared/dynamic_text.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    this.textSize,
    super.key,
  });

  final double? textSize;

  final title = 'TranslateTribune';
  final stringToReplace =
      'āăąδēėęěėęĺļľŀłńňņñøřŕŗřśŝşšťțабвгдеёжзийклмнопрстуфхцчшщъыьэюя';

  @override
  Widget build(BuildContext context) {
    return DynamicText(
      title,
      stringToReplace: stringToReplace,
      duration: const Duration(milliseconds: 400),
      animationDuration: const Duration(milliseconds: 200),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: textSize,
          ),
    );
  }
}
