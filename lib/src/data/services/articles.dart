import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:translatetribune/src/data/models/article.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

enum ArticleType {
  news,
  finances,
}

@lazySingleton
class ArticlesService extends ChangeNotifier {
  static const host = 'https://translatetribune.com';

  final whitespaceRE = RegExp(r"(?! )\s+| \s+");

  String url(String lang, ArticleType type) {
    if (type == ArticleType.finances) {
      return '$host/$lang-ft.html';
    }

    return '$host/$lang.html';
  }

  Future<List<Article>> loadWorldNews(String lang) =>
      _fetch(lang, ArticleType.news);

  Future<List<Article>> loadFinancialAndTechNews(String lang) =>
      _fetch(lang, ArticleType.finances);

  Future<List<Article>> _fetch(
    String lang,
    ArticleType type,
  ) async {
    final html = await _fetchHtml(url(lang, type));

    if (html == null) {
      return [];
    }

    return _parseHTML(html);
  }

  Future<String?> _fetchHtml(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return utf8.decode(response.bodyBytes);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  List<Article> _parseHTML(String html) {
    final document = parser.parse(html);
    final articleElements = document.querySelectorAll('.article');

    return articleElements.map((element) {
      final sourceFlagElement = element.querySelector('.source-flag');
      final flagPath = sourceFlagElement?.attributes['src'] ?? "";
      final flagName = flagPath.split('/').last.split('.').first;

      final flagAssetPath = 'assets/flags/$flagName.png';

      final countryElement = element.querySelector('.source-country');
      final country = countryElement?.text.trim() ?? "";

      final titleElement = element.querySelector('.article-title');
      final title = titleElement?.text.trim() ?? '';
      final id = titleElement?.id ?? '';

      String content =
          element.querySelector('.article-content')?.text.trim() ?? '';

      final linkElement = element.querySelector('a');
      final link = linkElement?.attributes['href'];
      final linkName = linkElement?.text.trim();

      /// Remove link name from the end
      final splitedContent = content.split(whitespaceRE);
      if (splitedContent.last == linkName) splitedContent.removeLast();

      content = splitedContent.join('\n\n');

      return Article(
        id: id,
        title: title.replaceAll(whitespaceRE, ' '),
        content: content,
        link: link,
        linkName: linkName,
        flagPath: flagAssetPath,
        country: country,
      );
    }).toList();
  }
}
