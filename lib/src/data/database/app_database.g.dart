// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SavedArticlesTable extends SavedArticles
    with TableInfo<$SavedArticlesTable, SavedArticle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _flagPathMeta =
      const VerificationMeta('flagPath');
  @override
  late final GeneratedColumn<String> flagPath = GeneratedColumn<String>(
      'flag_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _linkNameMeta =
      const VerificationMeta('linkName');
  @override
  late final GeneratedColumn<String> linkName = GeneratedColumn<String>(
      'link_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _savedAtMeta =
      const VerificationMeta('savedAt');
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
      'saved_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, flagPath, country, link, linkName, savedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_articles';
  @override
  VerificationContext validateIntegrity(Insertable<SavedArticle> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('flag_path')) {
      context.handle(_flagPathMeta,
          flagPath.isAcceptableOrUnknown(data['flag_path']!, _flagPathMeta));
    } else if (isInserting) {
      context.missing(_flagPathMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    if (data.containsKey('link_name')) {
      context.handle(_linkNameMeta,
          linkName.isAcceptableOrUnknown(data['link_name']!, _linkNameMeta));
    }
    if (data.containsKey('saved_at')) {
      context.handle(_savedAtMeta,
          savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta));
    } else if (isInserting) {
      context.missing(_savedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavedArticle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedArticle(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      flagPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flag_path'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link']),
      linkName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link_name']),
      savedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}saved_at'])!,
    );
  }

  @override
  $SavedArticlesTable createAlias(String alias) {
    return $SavedArticlesTable(attachedDatabase, alias);
  }
}

class SavedArticle extends DataClass implements Insertable<SavedArticle> {
  final String id;
  final String title;
  final String content;
  final String flagPath;
  final String country;
  final String? link;
  final String? linkName;
  final DateTime savedAt;
  const SavedArticle(
      {required this.id,
      required this.title,
      required this.content,
      required this.flagPath,
      required this.country,
      this.link,
      this.linkName,
      required this.savedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['flag_path'] = Variable<String>(flagPath);
    map['country'] = Variable<String>(country);
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    if (!nullToAbsent || linkName != null) {
      map['link_name'] = Variable<String>(linkName);
    }
    map['saved_at'] = Variable<DateTime>(savedAt);
    return map;
  }

  SavedArticlesCompanion toCompanion(bool nullToAbsent) {
    return SavedArticlesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      flagPath: Value(flagPath),
      country: Value(country),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      linkName: linkName == null && nullToAbsent
          ? const Value.absent()
          : Value(linkName),
      savedAt: Value(savedAt),
    );
  }

  factory SavedArticle.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedArticle(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      flagPath: serializer.fromJson<String>(json['flagPath']),
      country: serializer.fromJson<String>(json['country']),
      link: serializer.fromJson<String?>(json['link']),
      linkName: serializer.fromJson<String?>(json['linkName']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'flagPath': serializer.toJson<String>(flagPath),
      'country': serializer.toJson<String>(country),
      'link': serializer.toJson<String?>(link),
      'linkName': serializer.toJson<String?>(linkName),
      'savedAt': serializer.toJson<DateTime>(savedAt),
    };
  }

  SavedArticle copyWith(
          {String? id,
          String? title,
          String? content,
          String? flagPath,
          String? country,
          Value<String?> link = const Value.absent(),
          Value<String?> linkName = const Value.absent(),
          DateTime? savedAt}) =>
      SavedArticle(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        flagPath: flagPath ?? this.flagPath,
        country: country ?? this.country,
        link: link.present ? link.value : this.link,
        linkName: linkName.present ? linkName.value : this.linkName,
        savedAt: savedAt ?? this.savedAt,
      );
  @override
  String toString() {
    return (StringBuffer('SavedArticle(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('flagPath: $flagPath, ')
          ..write('country: $country, ')
          ..write('link: $link, ')
          ..write('linkName: $linkName, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, content, flagPath, country, link, linkName, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedArticle &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.flagPath == this.flagPath &&
          other.country == this.country &&
          other.link == this.link &&
          other.linkName == this.linkName &&
          other.savedAt == this.savedAt);
}

class SavedArticlesCompanion extends UpdateCompanion<SavedArticle> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> flagPath;
  final Value<String> country;
  final Value<String?> link;
  final Value<String?> linkName;
  final Value<DateTime> savedAt;
  final Value<int> rowid;
  const SavedArticlesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.flagPath = const Value.absent(),
    this.country = const Value.absent(),
    this.link = const Value.absent(),
    this.linkName = const Value.absent(),
    this.savedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavedArticlesCompanion.insert({
    required String id,
    required String title,
    required String content,
    required String flagPath,
    required String country,
    this.link = const Value.absent(),
    this.linkName = const Value.absent(),
    required DateTime savedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        content = Value(content),
        flagPath = Value(flagPath),
        country = Value(country),
        savedAt = Value(savedAt);
  static Insertable<SavedArticle> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? flagPath,
    Expression<String>? country,
    Expression<String>? link,
    Expression<String>? linkName,
    Expression<DateTime>? savedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (flagPath != null) 'flag_path': flagPath,
      if (country != null) 'country': country,
      if (link != null) 'link': link,
      if (linkName != null) 'link_name': linkName,
      if (savedAt != null) 'saved_at': savedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavedArticlesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String>? flagPath,
      Value<String>? country,
      Value<String?>? link,
      Value<String?>? linkName,
      Value<DateTime>? savedAt,
      Value<int>? rowid}) {
    return SavedArticlesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      flagPath: flagPath ?? this.flagPath,
      country: country ?? this.country,
      link: link ?? this.link,
      linkName: linkName ?? this.linkName,
      savedAt: savedAt ?? this.savedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (flagPath.present) {
      map['flag_path'] = Variable<String>(flagPath.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (linkName.present) {
      map['link_name'] = Variable<String>(linkName.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedArticlesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('flagPath: $flagPath, ')
          ..write('country: $country, ')
          ..write('link: $link, ')
          ..write('linkName: $linkName, ')
          ..write('savedAt: $savedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $SavedArticlesTable savedArticles = $SavedArticlesTable(this);
  late final SavedArticlesDao savedArticlesDao =
      SavedArticlesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [savedArticles];
}
