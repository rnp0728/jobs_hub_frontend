import 'package:url_launcher/url_launcher.dart';

class LaunchURL {
  static void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
