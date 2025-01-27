import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  // WhatsApp launcher
  static Future<void> whatsApp(String whatsApp) async {
    await launchUrl(Uri.parse('https://wa.me/$whatsApp'));
  }

  // Phone call launcher
  static Future<void> phoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  // Email Launcher
  static Future<void> email(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }

  // Website launcher
  static Future<void> websiteUrl(String website) async {
    await launchUrl(Uri.parse(website));
  }
}
