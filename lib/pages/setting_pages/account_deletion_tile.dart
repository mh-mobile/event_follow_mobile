import 'package:event_follow/models/controllers/users_controller/users_controller.dart';
import 'package:event_follow/pages/setting_pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountDeletionTile extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(usersProvider);
    final isLoading =
        useProvider(usersProvider.state.select((value) => value.isLoading));

    return !isLoading
        ? InkWell(
            onTap: () async {
              final result = await showDialog<AccountDeletionButtons>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("確認"),
                    content: Text("アカウントを削除してもよろしいですか？"),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(
                              context, AccountDeletionButtons.Cancel),
                          child: Text("Cancel")),
                      TextButton(
                          onPressed: () =>
                              Navigator.pop(context, AccountDeletionButtons.OK),
                          child: Text("OK")),
                    ],
                  );
                },
              );

              switch (result) {
                case AccountDeletionButtons.OK:
                  controller.setLoading(true);

                  await controller.requestAccountDeletion();
                  controller.setLoading(false);
                  break;
                case AccountDeletionButtons.Cancel:
                  break;
              }
            },
            child: ListTile(
              title: Text(
                "退会する",
                style: TextStyle(color: Colors.redAccent),
              ),
              dense: true,
            ),
          )
        : ListTile(
            leading: CircularProgressIndicator(),
          );
  }
}