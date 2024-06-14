import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import 'package:translatetribune/src/data/database/app_database.dart';
import 'package:translatetribune/src/data/database/tables/settings.dart';

part 'settings_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [UserSettings])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(super.db);

  static const id = 'SETTINGS';

  Future saveLanguage(String language) async {
    Insertable<UserSetting> entity = UserSetting(
      id: id,
      language: language,
    );

    return await into(userSettings).insertOnConflictUpdate(
      entity,
    );
  }

  Future<String?> getLanguage() async {
    final query = select(userSettings);

    final setting = await query.getSingleOrNull();

    return setting?.language;
  }

  Stream<UserSetting?> watchSettings() {
    final query = select(userSettings);

    return query.watchSingleOrNull();
  }
}
