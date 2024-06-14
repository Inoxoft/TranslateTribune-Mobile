import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/configs/router/app_router.gr.dart';
import 'package:translatetribune/src/data/services/language.dart';
import 'package:translatetribune/src/presentation/shared/settings_item.dart';
import 'package:translatetribune/src/data/services/notifications.dart';
import 'package:translatetribune/src/utils/launch.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  SettingsPage({
    super.key,
  });

  late final selectedLanguage = getIt<LanguagesService>().selectedLanguage!;
  late final language = getIt<LanguagesService>().engLanguage;

  final String languageEmoji = '\u{1F30E}';
  final String bellEmoji = '\u{1F514}';
  final String laptopEmoji = '\u{1F4BB}';
  final String heartWithRibbonEmoji = '\u{1F496}';
  final String envelopeEmoji = '\u{2709}';
  final String lockedWithKeyEmoji = '\u{1F510}';

  final String githubLink = 'https://github.com/Medusa-ML/TranslateTribune/';
  final String supportLink = 'https://www.patreon.com/bradflaugher';
  final String redactorLink = 'mailto:editor@translatetribune.com';
  final String privacyPolicyLink = 'https://translatetribune.com/privacy.html';

  String get now => DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

  void changeLanguage() => AppRouter.instance.replace(const WelcomeRoute());
  void openNotificationSettings() =>
      getIt<NotificationsService>().openNotificationsAppSettings();
  void openGitHub() => Launch.launchURL(githubLink);
  void openSupportUs() => Launch.launchURL(supportLink);
  void openWriteRedactor() => Launch.launchURL(redactorLink);
  void openPrivacyPolicy() => Launch.launchURL(privacyPolicyLink);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: theme.textTheme.bodyLarge,
        ),
      ),
      extendBodyBehindAppBar: false,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            SettingsItem(
              'Change articles language',
              subtitle: selectedLanguage.publishingLanguage,
              emoji: languageEmoji,
              onTap: changeLanguage,
            ),
            const SizedBox(height: 24.0),
            SettingsItem(
              language.notificationSettings,
              emoji: bellEmoji,
              onTap: openNotificationSettings,
            ),
            const SizedBox(height: 16.0),
            SettingsItem(
              language.openSource,
              emoji: laptopEmoji,
              onTap: openGitHub,
            ),
            // const SizedBox(height: 4.0),
            // FooterItem(
            //   '$heartWithRibbonEmoji ${language.supportUs}',
            //   onTap: openSupportUs,
            // ),
            const SizedBox(height: 16.0),
            SettingsItem(
              language.emailEditor,
              emoji: envelopeEmoji,
              onTap: openWriteRedactor,
            ),
            const SizedBox(height: 16.0),
            SettingsItem(
              language.privacyPolicy,
              emoji: lockedWithKeyEmoji,
              onTap: openPrivacyPolicy,
            ),
            const Spacer(),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.dividerColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                child: Text(
                  '${language.aiWarning}\n\n$now',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: theme.dividerColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
