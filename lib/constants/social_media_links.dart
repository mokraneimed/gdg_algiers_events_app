import 'package:url_launcher/url_launcher.dart';

Future<void> getInstagram() async {
  await launchUrl(
    Uri.parse("https://www.instagram.com/gdg_algiers/"),
  );
}

Future<void> getFacebook() async {
  await launchUrl(
    Uri.parse("https://www.facebook.com/GDGAlgiers"),
  );
}

Future<void> getDiscord() async {
  await launchUrl(
    Uri.parse("https://discord.gg/MQKxtvZ9G2"),
  );
}

Future<void> getLinkedin() async {
  await launchUrl(
    Uri.parse("https://www.linkedin.com/company/gdg-algiers/"),
  );
}

Future<void> getTwitter() async {
  await launchUrl(
    Uri.parse("https://twitter.com/GDG_Algiers"),
  );
}
