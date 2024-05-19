// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class LanguageModel with _$LanguageModel {
  const LanguageModel._();
  const factory LanguageModel({
    @JsonKey(name: 'publishing_language_short')
    required String publishingLanguageShort,

    @JsonKey(name: 'publishing_language') 
    required String publishingLanguage,

    @JsonKey(name: 'publishing_language_native')
    required String publishingLanguageNative,

    @Default('') String persona,
    @Default('') String motto,

    @Default('')
    @JsonKey(name: 'select_language_label')
    String selectLanguageLabel,

    @Default('')
    @JsonKey(name: 'finance_technology_persona')
    String financeTechnologyPersona,

    @Default('')
    @JsonKey(name: 'publishing_timezone')
    String publishingTimezone,
    
    @Default('') 
    @JsonKey(name: 'world_news') 
    String worldNews,

    @Default('')
    @JsonKey(name: 'finance_technology')
    String financeTechnology,

    @Default('')
    @JsonKey(name: 'logic_puzzles')  
    String logicPuzzles,

    @Default('')
    @JsonKey(name: 'language_selection')  
    String languageSelection,

    @Default('')
    @JsonKey(name: 'notification_settings')  
    String notificationSettings,

    @Default('')
    @JsonKey(name: 'open_source')  
    String openSource,

    @Default('')
    @JsonKey(name: 'support_us')  
    String supportUs,

    @Default('')
    @JsonKey(name: 'email_editor') 
    String emailEditor,

    @Default('')
    @JsonKey(name: 'privacy_policy') 
    String privacyPolicy,

    @Default('')
    @JsonKey(name: 'ai_warning') 
    String aiWarning,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}
