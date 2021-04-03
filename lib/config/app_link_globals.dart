import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppLink {
  Terms,
  PrivacyPolicy,
}

extension AppLinkExtension on AppLink {
  static final links = {
    AppLink.Terms: "https://${env["APP_DOMAIN"]}/terms",
    AppLink.PrivacyPolicy: "https://${env["APP_DOMAIN"]}/privacy_policy",
  };

  String get url => links[this]!;
}
