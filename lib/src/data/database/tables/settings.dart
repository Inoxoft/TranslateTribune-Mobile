import 'package:drift/drift.dart';

@DataClassName('UserSetting')
class UserSettings extends Table {
  TextColumn get id => text()();
  TextColumn get language => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}
