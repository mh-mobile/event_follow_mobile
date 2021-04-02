import 'package:event_follow/models/api.dart';

class AccountDeletionApiRequest extends ApiRequest {
  AccountDeletionApiRequest();

  @override
  bool get isAuthenticationReauired => true;

  @override
  String get apiPath => ApiInfo.USERS.apiPath;

  @override
  HttpMethod get httpMethod => HttpMethod.DELETE;
}