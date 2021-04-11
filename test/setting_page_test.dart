import 'package:event_follow/pages/setting_pages/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('SettingPage', (WidgetTester tester) async {
    await tester.pumpWidget(StatefulBuilder(builder: (_, __) {
      return ProviderScope(
        child: MaterialApp(
          home: SettingPage(),
        ),
      );
    }));

    await tester.pump();

    expect(find.text('利用規約'), findsOneWidget);
    expect(find.text('プライバシーポリシー'), findsOneWidget);
    expect(find.text('ライセンス'), findsOneWidget);
    expect(find.text('退会する'), findsOneWidget);
  });
}
