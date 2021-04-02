import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'account_deletion_api_request.dart';
import 'account_deletion_api_response.dart';

final usersRepositoryProvider = Provider.autoDispose.family<UsersRepository, dynamic>(
        (ref, getOrGenerateIdToken) => UsersRepository(getOrGenerateIdToken: getOrGenerateIdToken));

class UsersRepository {
  final getOrGenerateIdToken;

  UsersRepository({required this.getOrGenerateIdToken});

  Future<AccountDeletionApiResponse> requestAccountDeletion(AccountDeletionApiRequest request) async {
    final url = request.uri;

    final response = await http.delete(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
        "Bearer ${await this.getOrGenerateIdToken()}"
      },
    );

    if (response.statusCode == 204) {
      return AccountDeletionApiResponse(status: "OK");
    } else {
      return AccountDeletionApiResponse(status: "NG");
    }
  }
}

