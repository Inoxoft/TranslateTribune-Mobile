import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/configs/router/app_router.gr.dart';
import 'package:translatetribune/src/data/database/daos/settings_dao.dart';

import 'package:translatetribune/src/data/models/language_model.dart';
import 'package:translatetribune/src/configs/resources/languages.dart';
import 'package:collection/collection.dart';

@lazySingleton
class LanguagesService extends ChangeNotifier {
  LanguagesService(this.dao);

  final SettingsDao dao;

  final List<LanguageModel> languages = languagesJson
      .map(
        (json) => LanguageModel.fromJson(json),
      )
      .toList();

  LanguageModel? selectedLanguage;

  LanguageModel get engLanguage =>
      languages.firstWhereOrNull(
        (language) => language.publishingLanguageShort == 'en',
      ) ??
      languages.first;

  void init() async {
    final code = await dao.getLanguage();

    if (code != null) {
      final language = getLanguageByCode(code);

      await selectLanguage(language);

      AppRouter.instance.replace(const HomeRoute());
    } else {
      AppRouter.instance.replace(const WelcomeRoute());
    }
  }

  LanguageModel getLanguageByCode(String code) {
    return languages.firstWhere(
      (language) => language.publishingLanguageShort == code,
    );
  }

  Future<void> selectLanguage(LanguageModel language) async {
    await dao.saveLanguage(language.publishingLanguageShort);

    selectedLanguage = language;
    notifyListeners();
  }

  Future<void> openLanguage(LanguageModel language) async {
    await selectLanguage(language);

    AppRouter.instance.replace(const ArticlesRoute());
  }
}
