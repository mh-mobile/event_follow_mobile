import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api.dart';
import 'sessions_api_request.dart';
import 'sessions_api_response.dart';

final sessionsRepositoryProvider =
    Provider.autoDispose((ref) => SessionsRepository(read: ref.read));

class SessionsRepository {
  final Reader read;
  SessionsRepository({required this.read});

  Future<SessionsApiResponse> requestSessionsApi(
      {required SessionsApiRequest request}) async {
    final apiClient = read(apiClientProvider);
    final response = await apiClient.request(request);

    if (response.statusCode == 200) {
      return SessionsApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Login Failed');
    }
  }
}
