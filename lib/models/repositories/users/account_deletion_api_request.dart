import 'package:event_follow/models/api.dart';

class AccountDeletionApiRequest extends ApiRequest {
  AccountDeletionApiRequest();

  @override
  String get getApiPath => ApiInfo.USERS.getApiPath;
}
