import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperClass {
  static void shareApp() {
    Share.share(
      'Check out this awesome app: https://www.facebook.com/emanmahfouz144',
    );
  }

  static Future<void> goToWebPage(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  String getFullImageUrl(String path) {
    final cleanedPath = path.replaceFirst('uploads/', '');
    return 'https://zbooma.com/$cleanedPath';
  }
}
