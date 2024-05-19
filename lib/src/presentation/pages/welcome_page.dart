import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/configs/router/app_router.gr.dart';
import 'package:translatetribune/src/data/models/language_model.dart';
import 'package:translatetribune/src/presentation/shared/language_item.dart';
import 'package:translatetribune/src/data/services/language.dart';
import 'package:translatetribune/src/utils/launch.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final LanguagesService languagesService = getIt<LanguagesService>();

  late final List<LanguageModel> languages = languagesService.languages;

  LanguageModel get activeLanguage => languages[_activeLanguageIndex];

  int _activeLanguageIndex = 0;

  Timer? _timer;

  final String inoxoftLink = 'https://inoxoft.com/';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: 4500),
      (timer) => nextActiveLanguage(),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void nextActiveLanguage() {
    setState(() {
      _activeLanguageIndex = (_activeLanguageIndex + 1) % languages.length;
    });
  }

  void openLanguage(LanguageModel language) {
    AppRouter.instance.push(ArticlesRoute(language: language));
  }

  void openMenu() {
    final language = languages.first;
    AppRouter.instance.push(MenuRoute(language: language));
  }

  void openInoxoft() => Launch.launchURL(inoxoftLink);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              openMenu();
            },
            icon: Icon(
              Icons.menu,
              color: theme.indicatorColor,
            ),
            highlightColor: theme.highlightColor,
            splashColor: theme.highlightColor,
            hoverColor: theme.highlightColor,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SafeArea(
          top: false,
          left: true,
          right: true,
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // const Flexible(
              //   child: LettersBG(),
              // ),
              // const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Image.asset('assets/title.png'),
              ),
              const SizedBox(height: 16.0),
              Wrap(
                spacing: 0.1,
                runSpacing: 0.1,
                alignment: WrapAlignment.center,
                children: languages.map((language) {
                  return LanguageItem(
                    language,
                    openLanguage: openLanguage,
                  );
                }).toList(),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'AI-CURATED ',
                        style: theme.textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: 'GLOBAL NEWS ',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                      TextSpan(
                        text: 'THE WORLD\'S ',
                        style: theme.textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: 'WHISPER ',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                      TextSpan(
                        text: 'LOUD ',
                        style: theme.textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: 'AND CLEAR',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // const SizedBox(height: 24.0),
              // const Flexible(
              //   child: LettersBG(),
              // ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Made with \u{2764} by',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4.0),
                    GestureDetector(
                      onTap: openInoxoft,
                      child: SizedBox(
                        width: 64,
                        child: Image.asset('assets/inoxoft_logo.png'),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
