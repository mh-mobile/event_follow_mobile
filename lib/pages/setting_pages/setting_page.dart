import 'package:event_follow/models/controllers/users_controller/users_controller.dart';
import 'package:event_follow/pages/home_pages/home_page.dart';
import 'package:event_follow/pages/setting_pages/account_deletion_tile.dart';
import 'package:event_follow/pages/setting_pages/app_version_tile.dart';
import 'package:event_follow/pages/setting_pages/privacy_policy_tile.dart';
import 'package:event_follow/pages/setting_pages/terms_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../main.dart';
import 'license_tile.dart';

enum AccountDeletionButtons { ok, cancel }

enum SettingItemType {
  terms,
  privacyPolicy,
  license,
  accountDeletion,
  appVersion,
}

final _shouldLogout = Provider.autoDispose(
    (ref) => ref.watch(usersProvider.state).status == UsersStatus.ok);

class SettingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView.separated(
          itemCount: SettingItemType.values.length,
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black12,
              height: 1,
            );
          },
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            switch (SettingItemType.values[index]) {
              case SettingItemType.terms:
                return TermsTile();
              case SettingItemType.privacyPolicy:
                return PrivacyPolicyTile();
              case SettingItemType.license:
                return LicenseTile();
              case SettingItemType.accountDeletion:
                return ProviderListener(
                  provider: _shouldLogout,
                  onChange: (BuildContext context, bool shouldLogout) {
                    if (shouldLogout) {
                      firebaseAuth.signOut();
                      Navigator.of(context).popUntil((root) => root.isFirst);
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, _, __) => HomePage(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    }
                  },
                  child: AccountDeletionTile(),
                );
              case SettingItemType.appVersion:
                return AppVersion();
            }
          }),
    );
  }
}
