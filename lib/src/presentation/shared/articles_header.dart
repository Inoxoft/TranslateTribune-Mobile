import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/data/models/language_model.dart';
import 'package:translatetribune/src/presentation/shared/app_title.dart';

class ArticlesHeader extends StatelessWidget {
  const ArticlesHeader({
    required this.language,
    required this.openSearch,
    required this.setFilter,
    required this.searchOpened,
    required this.searchController,
    super.key,
  });

  final LanguageModel language;
  final void Function() openSearch;
  final void Function() setFilter;
  final bool searchOpened;
  final TextEditingController searchController;

  void clear() {
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        if (searchOpened)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 36.0,
            ),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              onChanged: (_) => setFilter(),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 14,
              ),
              cursorColor: Colors.black,
              autocorrect: false,
              enableSuggestions: false,
              autofocus: true,
            ),
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppTitle(
                textSize: 22,
              ),
              const SizedBox(
                width: double.infinity,
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  '"${language.motto}"',
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              searchOpened ? openSearch() : AppRouter.instance.maybePop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: theme.indicatorColor,
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              searchOpened ? clear() : openSearch();
            },
            icon: Icon(
              searchOpened ? Icons.close : Icons.search,
              color: theme.indicatorColor,
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
