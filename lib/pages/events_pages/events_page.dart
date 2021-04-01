import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:event_follow/models/repositories/events/events_repository.dart';
import 'package:event_follow/pages/events_pages/event_drawer_header.dart';
import 'package:event_follow/ui/sort_filter_button.dart';
import 'package:event_follow/ui/sort_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/sort_filter_globals.dart';
import 'event_listview.dart';

final sortFilterStateKey = GlobalKey<SortFilterButtonState>();

class EventsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(eventsProvider);
    final sortFilterStateStore = useProvider(eventsConditionProvider).state;
    if (sortFilterStateStore != null) {
      sortFilterStateKey.currentState?.setCondition(sortFilterStateStore);
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo_notext.png",
          height: 30,
        ),
        actions: [
          SortFilterButton(
              key: sortFilterStateKey,
              selectedStateStore: sortFilterStateStore,
              onTap: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  transitionDuration: Duration(milliseconds: 300),
                  barrierLabel: "sort&filter",
                  barrierColor: Colors.black.withOpacity(0.5),
                  pageBuilder: (context, _, __) {
                    return SortFilterDialog(
                      store: sortFilterStateStore!,
                      onChange: (store) {
                        sortFilterStateKey.currentState?.setCondition(store);

                        controller.request(EventsApiRequest(
                            pageId: "1",
                            sort: store.sortType.typeName,
                            time: store.timeFilterType?.typeName,
                            friends: store.friendFilterType?.typeName));
                      },
                    );
                  },
                  transitionBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: CurvedAnimation(
                              parent: animation, curve: Curves.easeOut)
                          .drive(Tween<Offset>(
                        begin: Offset(0, -1.0),
                        end: Offset.zero,
                      )),
                      child: child,
                    );
                  },
                );
              })
        ],
      ),
      drawer: EventDrawerHeader(),
      body: EventListView(),
    );
  }
}

