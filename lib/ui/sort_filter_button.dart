import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/sort_filter_globals.dart';

class SortFilterButton extends StatefulWidget {
  const SortFilterButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  State<StatefulWidget> createState() => SortFilterButtonState();
}

class SortFilterButtonState extends State<SortFilterButton> {
  bool _pressing = false;
  SortFilterStateStore? selectedStateStore;

  final sortLabels = [
    ["Friend", "数"],
    ["新着", "順"],
    ["投稿", "順"],
    ["開催が近い", "順"],
  ];

  final friendsFilterLabels = [
    ["Friends", "1+"],
    ["Friends", "2+"],
    ["Friends", "3+"],
    ["Friends", "4+"],
    ["Friends", "5+"],
  ];

  final timeFilterLabels = [
    ["8", "hrs"],
    ["24", "hrs"],
    ["2", "days"],
    ["3", "hrs"],
    ["4", "hrs"],
    ["5", "hrs"],
    ["6", "hrs"],
    ["1", "week"],
    ["All"],
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        setState(() {
          _pressing = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _pressing = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _pressing = false;
        });
      },
      onTap: widget.onTap,
      child: selectedStateStore == null
          ? SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.all(6),
              child: AnimatedOpacity(
                opacity: _pressing ? 0.4 : 1,
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
                        children: _createSortList(),
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
                        children: _createFilterList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  List<Text> _createSortList() {
    final labels = sortLabels[selectedStateStore!.sortType.index];
    return labels
        .map((label) => Text(label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))
        .toList();
  }

  List<Text> _createFilterList() {
    if (selectedStateStore?.sortType == SortType.FriendsNumber) {
      return _createTimeFilterList();
    }

    return _createFriendsFilterList();
  }

  List<Text> _createFriendsFilterList() {
    final labels =
        friendsFilterLabels[selectedStateStore!.friendFilterType!.index];
    return labels
        .map((label) => Text(label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))
        .toList();
  }

  List<Text> _createTimeFilterList() {
    final labels = timeFilterLabels[selectedStateStore!.timeFilterType!.index];
    return labels
        .map((label) => Text(label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)))
        .toList();
  }

  void setCondition(SortFilterStateStore store) {
    setState(() {
      this.selectedStateStore = store;
    });
  }
}
