import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import 'package:translatetribune/src/data/database/app_database.dart';
import 'package:translatetribune/src/data/database/tables/saved_articles.dart';

part 'saved_articles_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [SavedArticles])
class SavedArticlesDao extends DatabaseAccessor<AppDatabase>
    with _$SavedArticlesDaoMixin {
  SavedArticlesDao(super.db);

  Future createSavedArticles(List<Insertable<SavedArticle>> entities) async {
    return batch((batch) => batch.insertAll(
          savedArticles,
          entities,
          mode: InsertMode.insertOrReplace,
        ));
  }

  Future createSavedArticle(Insertable<SavedArticle> entity) async {
    return await into(savedArticles).insert(
      entity,
      mode: InsertMode.insertOrReplace,
    );
  }

  Stream<SavedArticle?> watchSavedArticleById(String id) {
    final query = select(savedArticles);

    query.where((tbl) => tbl.id.equals(id));

    return query.watchSingleOrNull();
  }

  Future<List<SavedArticle>> getAllSavedArticles() {
    final query = select(savedArticles);

    query.orderBy([
      (article) => OrderingTerm(
            expression: article.savedAt,
            mode: OrderingMode.desc,
          ),
    ]);

    return query.get();
  }

  Stream<List<SavedArticle>> watchAllSavedArticles() {
    return select(savedArticles).watch();
  }

  Future updateSavedArticle(Insertable<SavedArticle> entity) {
    return update(savedArticles).replace(entity);
  }

  Future deleteSavedArticle(Insertable<SavedArticle> entity) {
    return delete(savedArticles).delete(entity);
  }

  Future clearTable() {
    return delete(savedArticles).go();
  }
}
