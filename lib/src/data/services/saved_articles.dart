import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:translatetribune/src/data/database/app_database.dart';
import 'package:translatetribune/src/data/database/daos/saved_articles_dao.dart';
import 'package:translatetribune/src/data/models/article.dart';

@lazySingleton
class SavedArticlesService extends ChangeNotifier {
  SavedArticlesService(this.dao);

  final SavedArticlesDao dao;

  Future saveArticle(Article article) async {
    await dao.createSavedArticle(article.convertToSaved());
  }

  Future removeFromSavedArticle(Article article) async {
    await dao.deleteSavedArticle(article.convertToSaved());
  }

  Stream<List<SavedArticle>> watchAllSavedArticles() {
    return dao.watchAllSavedArticles();
  }

  Stream<SavedArticle?> watchSavedArticleById(String id) {
    return dao.watchSavedArticleById(id);
  }
}
