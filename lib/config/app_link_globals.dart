import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppLink {
  terms,
  privacyPolicy,
}

extension AppLinkExtension on AppLink {
  static final links = {
    AppLink.terms: "https://${env["APP_DOMAIN"]}/terms",
    AppLink.privacyPolicy: "https://${env["APP_DOMAIN"]}/privacy_policy",
  };

  String get url => links[this]!;
}
