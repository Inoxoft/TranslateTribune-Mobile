import 'package:url_launcher/url_launcher.dart';

class Launch {
  static void launchURL(String source) async {
    final url = Uri.tryParse(source);

    if (url == null) {
      return;
    }

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    }
  }
}
