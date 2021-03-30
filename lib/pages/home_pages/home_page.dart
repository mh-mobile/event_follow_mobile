import 'package:event_follow/pages/events_pages/events_page.dart';
import 'package:event_follow/pages/home_pages/home_footer.dart';
import 'package:event_follow/pages/home_pages/twitter_login_button.dart';
import 'package:event_follow/models/controllers/controllers.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_logo.dart';

final _shouldPush = Provider.autoDispose(
    (ref) => ref.watch(sessionsProvider.state).status == SessionsStatus.OK);

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isLoading =
        useProvider(sessionsProvider.state.select((value) => value.isLoading));

    return ProviderListener(
      provider: _shouldPush,
      onChange: (context, bool shouldPush) {
        if (shouldPush) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return EventsPage();
              }));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 6 / 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Container()),
                  HomeLogo(),
                  Expanded(flex: 2, child: Container()),
                  !isLoading
                      ? TwitterLoginButton()
                      : Container(
                          height: 44,
                          width: 44,
                          child: CircularProgressIndicator()),
                  Expanded(flex: 3, child: Container()),
                  HomeFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
