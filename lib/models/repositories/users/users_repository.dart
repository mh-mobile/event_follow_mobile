import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final usersRepositoryProvider = Provider.autoDispose.family<UsersRepository, dynamic>(
        (ref, getOrGenerateIdToken) => UsersRepository(getOrGenerateIdToken: getOrGenerateIdToken));

class UsersRepository {
  final getOrGenerateIdToken;

  UsersRepository({required this.getOrGenerateIdToken});

  Future<AccountDeletionApiResults> requestAccountDeletion() async {
    final url = Uri.https("event-follow-front.herokuapp.com", "/api/users");

    final response = await http.delete(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
        "Bearer ${await this.getOrGenerateIdToken()}"
      },
    );

    if (response.statusCode == 204) {
      return AccountDeletionApiResults(status: "OK");
    } else {
      return AccountDeletionApiResults(status: "NG");
    }
  }
}

class AccountDeletionApiResults {
  final String status;

  AccountDeletionApiResults({
    required this.status,
  });
}
