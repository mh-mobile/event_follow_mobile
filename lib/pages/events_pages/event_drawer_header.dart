import 'package:cached_network_image/cached_network_image.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 60,
                    child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: firebaseAuth.currentUser!.photoURL!,
                            placeholder: (context, url) => Container(
                              color: const Color(0xffd7d7d8),
                            ),
                            fit: BoxFit.cover,
                          ),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    firebaseAuth.currentUser!.displayName!,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("設定"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingPage();
              }));
            },
          ),
          ListTile(
            title: Text("ログアウト"),
            onTap: () {
              firebaseAuth.signOut();
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, _, __) => HomePage(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
