import 'package:event_follow/models/api.dart';

class AccountDeletionApiResponse extends ApiRequest {
  final String status;

  AccountDeletionApiResponse({
    required this.status,
  });

  @override
  String get getApiPath => ApiInfo.USERS.getApiPath;
}
