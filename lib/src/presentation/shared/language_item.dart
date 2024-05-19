import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translatetribune/src/data/models/language_model.dart';

class LanguageItem extends StatefulWidget {
  const LanguageItem(
    this.language, {
    required this.openLanguage,
    super.key,
  });

  final LanguageModel language;
  final void Function(LanguageModel) openLanguage;

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  late final LanguageModel language = widget.language;
  late final void Function(LanguageModel) openLanguage = widget.openLanguage;

  bool hovered = false;

  void onHover(bool hovered) {
    if (this.hovered != hovered) {
      setState(() {
        this.hovered = hovered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (_) {
        HapticFeedback.mediumImpact();
        onHover(true);
      },
      onTapUp: (_) => onHover(false),
      onTapCancel: () => onHover(false),
      onTap: () {
        HapticFeedback.mediumImpact();
        openLanguage(language);
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Transform.rotate(
              angle: -0.0349066,
              child: AnimatedOpacity(
                opacity: hovered ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
                child: ColoredBox(
                  color: theme.hoverColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Text(
              language.publishingLanguageNative,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                // decoration: TextDecoration.underline,
                // decorationColor: theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
