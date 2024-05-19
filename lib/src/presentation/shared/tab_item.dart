import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabItem extends StatefulWidget {
  const TabItem(
    this.text, {
    required this.index,
    required this.tabController,
    super.key,
  });

  final String text;
  final int index;
  final TabController tabController;

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  late final String text = widget.text;
  late final int index = widget.index;
  late final TabController tabController = widget.tabController;

  bool hovered = false;

  @override
  void initState() {
    tabController.addListener(onSelected);
    super.initState();
  }

  @override
  void dispose() {
    tabController.removeListener(onSelected);
    super.dispose();
  }

  void selectTab() {
    tabController.animateTo(index);
  }

  bool get selected => tabController.index == index;

  void onHover(bool hovered) {
    if (this.hovered != hovered) {
      setState(() {
        this.hovered = hovered;
      });
    }
  }

  void onSelected() async {
    setState(() {});
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
        selectTab();
      },
      child: SizedBox(
        height: 44,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.rotate(
                angle: -0.0349066,
                child: AnimatedOpacity(
                  opacity: hovered || selected ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                  child: ColoredBox(
                    color: hovered
                        ? theme.hoverColor
                        : selected
                            ? theme.indicatorColor
                            : Colors.transparent,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 12,
                  color: selected && !hovered ? Colors.white : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
