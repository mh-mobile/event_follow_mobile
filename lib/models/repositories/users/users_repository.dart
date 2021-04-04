import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api.dart';
import 'account_deletion_api_request.dart';
import 'account_deletion_api_response.dart';

final usersRepositoryProvider = Provider.autoDispose<UsersRepository>(
    (ref) => UsersRepository(read: ref.read));

class UsersRepository {
  UsersRepository({required this.read});

  final Reader read;

  Future<AccountDeletionApiResponse> requestAccountDeletion(
      AccountDeletionApiRequest request) async {
    final apiClient = read(apiClientProvider);
    final response = await apiClient.request(request);

    if (response.statusCode == 204) {
      return AccountDeletionApiResponse(status: 'OK');
    } else {
      return AccountDeletionApiResponse(status: 'NG');
    }
  }
}
