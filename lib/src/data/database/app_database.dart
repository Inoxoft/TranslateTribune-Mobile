// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';

import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'daos/saved_articles_dao.dart';
import 'tables/saved_articles.dart';

part 'app_database.g.dart';

@singleton
@DriftDatabase(
  tables: [
    SavedArticles,
  ],
  daos: [
    SavedArticlesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.addColumn(savedArticles, savedArticles.country);
            await m.addColumn(savedArticles, savedArticles.flagPath);
          }
        },
      );

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();

      final dbFolder = await getDatabasesPath();
      final file = File(p.join(dbFolder, 'db.sqlite'));

      return NativeDatabase(
        file,
        logStatements: true,
      );
    });
  }
}
