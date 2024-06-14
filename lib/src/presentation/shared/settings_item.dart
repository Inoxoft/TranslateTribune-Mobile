import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(
    this.title, {
    required this.emoji,
    required this.onTap,
    this.subtitle,
    super.key,
  });

  final String emoji;
  final String title;
  final String? subtitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  emoji,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!.toUpperCase(),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.focusColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.start,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
