import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AccountDeletionButtons {
  OK,
  Cancel
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
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
                    print("OK");
                    break;
                  case AccountDeletionButtons.Cancel:
                    print("Cancel");
                    break;
                }
              },
              child: ListTile(
                title: Text("退会する", style: TextStyle(color: Colors.redAccent),),
              ),
            );
          }),
    );
  }
}
