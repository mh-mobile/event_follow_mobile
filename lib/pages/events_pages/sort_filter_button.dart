import 'package:event_follow/config/sort_filter_globals.dart';
import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sortFilterButtonPressingProvider =
    StateProvider.autoDispose<bool>((ref) => false);

class SortFilterButton extends HookWidget {
  const SortFilterButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final sortFilterStateStore =
        useProvider(eventsConditionProvider).state;
    final sortFilterPressing = useProvider(sortFilterButtonPressingProvider).state;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        context.read(sortFilterButtonPressingProvider).state = true;
      },
      onTapUp: (_) {
        context.read(sortFilterButtonPressingProvider).state = false;
      },
      onTapCancel: () {
        context.read(sortFilterButtonPressingProvider).state = false;
      },
      onTap: this.onTap,
      child: sortFilterStateStore == null
          ? SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.all(6),
              child: AnimatedOpacity(
                opacity: sortFilterPressing
                    ? 0.4
                    : 1,
                duration: Duration(milliseconds: 160),
                child: Container(
                  height: 44,
                  margin: EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _createSortList(sortFilterStateStore),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          "x",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _createFilterList(sortFilterStateStore),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  List<Text> _createSortList(SortFilterStateStore store) {
    final labels =
        SortTypeExtension.sortFilterButtonSortLabels[store.sortType.index];
    return labels
        .map((label) => Text(label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))
        .toList();
  }

  List<Text> _createFilterList(SortFilterStateStore store) {
    if (store.sortType == SortType.FriendsNumber) {
      return _createTimeFilterList(store);
    }

    return _createFriendsFilterList(store);
  }

  List<Text> _createFriendsFilterList(SortFilterStateStore store) {
    final labels = FriendsFilterTypeExtension
        .sortFilterButtonFriendsFilterLabels[store.friendFilterType!.index];
    return labels
        .map((label) => Text(label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))
        .toList();
  }

  List<Text> _createTimeFilterList(SortFilterStateStore store) {
    final labels = TimeFilterTypeExtension
        .sortFilterButtonTimeFilterLabels[store.timeFilterType!.index];
    return labels
        .map((label) => Text(label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))
        .toList();
  }

}
