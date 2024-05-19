import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(
    this.text, {
    required this.onTap,
    super.key,
  });

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          onTap();
        },
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
