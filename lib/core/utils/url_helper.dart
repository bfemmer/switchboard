import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> textMessage(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static void sendEmail(String subject, String body) async {
    final Uri launchUri =
        Uri(scheme: 'mailto', query: 'subject=$subject&body=$body');
    await launchUrl(launchUri);
  }

  static void launchBrowser(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}
