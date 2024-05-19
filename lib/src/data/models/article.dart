import 'package:drift/drift.dart' show Insertable, Value;
import 'package:translatetribune/src/data/database/app_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const Article._();
  const factory Article({
    required String id,
    required String title,
    required String content,
    required String flagPath,
    required String country,
    String? link,
    String? linkName,
  }) = _Article;

  bool get hasSource =>
      link != null &&
      link!.isNotEmpty &&
      linkName != null &&
      linkName!.isNotEmpty;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  factory Article.fromSaved(SavedArticle saved) => Article(
        id: saved.id,
        title: saved.title,
        content: saved.content,
        link: saved.link,
        linkName: saved.linkName,
        flagPath: saved.flagPath,
        country: saved.country,
      );

  Insertable<SavedArticle> convertToSaved() {
    return SavedArticlesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      flagPath: Value(flagPath),
      country: Value(country),
      link: Value(link),
      linkName: Value(linkName),
      savedAt: Value(DateTime.now()),
    );
  }
}
