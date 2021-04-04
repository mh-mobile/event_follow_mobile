import 'package:event_follow/pages/home_pages/home_page.dart';
import 'package:event_follow/pages/setting_pages/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class EventDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 60,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          firebaseAuth.currentUser!.photoURL!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    firebaseAuth.currentUser!.displayName!,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: const Text('設定'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingPage();
              }));
            },
          ),
          ListTile(
            title: const Text('ログアウト'),
            onTap: () {
              firebaseAuth.signOut();
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, _, __) => HomePage(),
                  transitionDuration: const Duration(seconds: 0),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
