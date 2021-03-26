import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../repository/account_deletion_repository.dart';
import '../main.dart';
import '../utils/app_utils.dart';
import 'home.dart';

enum AccountDeletionButtons {
  OK,
  Cancel
}

enum SettingItemType {
  AccountDeletion,
  AppVersion,
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: ListView.builder(
          itemCount: SettingItemType.values.length,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            switch(SettingItemType.values[index]) {
              case SettingItemType.AccountDeletion:
                return InkWell(
                  onTap: () async {
                    final result = await showDialog<AccountDeletionButtons>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("確認"),
                          content: Text("アカウントを削除してもよろしいですか？"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context, AccountDeletionButtons.Cancel),
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () => Navigator.pop(context, AccountDeletionButtons.OK),
                                child: Text("OK")),
                          ],
                        );
                      },
                    );

                    switch (result) {
                      case AccountDeletionButtons.OK:
                        final accountDeletionRepository = AccountDeletionRepository(getOrGenerateIdToken: firebaseAuth.currentUser?.getIdToken);
                        final results = await accountDeletionRepository.requestAccountDeletion();
                        if (results.status == "OK") {
                          firebaseAuth.signOut();
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, _, __) => Home(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
                        }
                        break;
                      case AccountDeletionButtons.Cancel:
                        break;
                    }
                  },
                  child: ListTile(
                    title: Text("退会する", style: TextStyle(color: Colors.redAccent),),
                  ),
                );
                break;
              case SettingItemType.AppVersion:
                return FutureBuilder(
                  future: AppUtils.getAppVersion(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox.shrink();
                    }

                    return Center(
                      child: Text("ver ${snapshot.data as String}", style: TextStyle(color: Colors.grey[600])),
                    );
                  },
                );
                break;
              default:
                return Container(); break;
            }
          }),
    );
  }
}
