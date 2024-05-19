import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:translatetribune/src/data/models/language_model.dart';
import 'package:translatetribune/src/configs/resources/languages.dart';

@lazySingleton
class LanguagesService extends ChangeNotifier {
  final List<LanguageModel> languages = languagesJson
      .map(
        (json) => LanguageModel.fromJson(json),
      )
      .toList();

  LanguageModel? selectedLanguage;

  void selectLanguage(LanguageModel language) {
    selectedLanguage = language;
    notifyListeners();
  }
}
