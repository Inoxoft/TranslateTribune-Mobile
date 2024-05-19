import 'package:drift/drift.dart';

@DataClassName('SavedArticle')
class SavedArticles extends Table {
  TextColumn get id => text().unique()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get flagPath => text()();
  TextColumn get country => text()();
  TextColumn get link => text().nullable()();
  TextColumn get linkName => text().nullable()();
  DateTimeColumn get savedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
