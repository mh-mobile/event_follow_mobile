import 'package:event_follow/pages/home_pages/home_page.dart';
import 'package:event_follow/pages/setting_pages/privacy_policy_tile.dart';
import 'package:event_follow/pages/setting_pages/terms_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../repository/account_deletion_repository.dart';
import '../../main.dart';
import '../../utils//app_utils.dart';

enum AccountDeletionButtons {
  OK,
  Cancel
}

enum SettingItemType {
  Terms,
  PrivacyPolicy,
  AccountDeletion,
  AppVersion,
}

class SettingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: ListView.separated(
          itemCount: SettingItemType.values.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.black12,
              height: 1,
            );
          },
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            switch(SettingItemType.values[index]) {
              case SettingItemType.Terms:
                return TermsTile();
              case SettingItemType.PrivacyPolicy:
                return PrivacyPolicyTile();
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
                              pageBuilder: (context, _, __) => HomePage(),
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
                    dense: true,
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

                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text("ver ${snapshot.data as String}", style: TextStyle(color: Colors.grey[600])),
                      ),
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
