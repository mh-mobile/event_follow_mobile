import 'package:event_follow/ui/sort_filter_button.dart';
import 'package:flutter/material.dart';

enum _SortFilterSegmentType { Sort, Filter }

final sortTypeItems = [
  SortFilterTypeItem(label: "Friend数", type: SortType.FriendsNumber),
  SortFilterTypeItem(label: "新着順", type: SortType.RecentOrder),
  SortFilterTypeItem(label: "投稿順", type: SortType.CreatedOrder),
  SortFilterTypeItem(label: "開催が近い順", type: SortType.ClosenessOrder),
];

final friendsFilterItems = [
  SortFilterTypeItem(
      label: "Friends 1+", type: FriendsFilterType.OneOrMoreFriends),
  SortFilterTypeItem(
      label: "Friends 2+", type: FriendsFilterType.TwoOrMoreFriends),
  SortFilterTypeItem(
      label: "Friends 3+", type: FriendsFilterType.ThreeOrMoreFriends),
  SortFilterTypeItem(
      label: "Friends 4+", type: FriendsFilterType.FourOrMoreFriends),
  SortFilterTypeItem(
      label: "Friends 5+", type: FriendsFilterType.FiveOrMoreFriends),
];

final timeFilterItems = [
  SortFilterTypeItem(label: "8時間", type: TimeFilterType.EightHours),
  SortFilterTypeItem(label: "24時間", type: TimeFilterType.TwentyFourHour),
  SortFilterTypeItem(label: "2日", type: TimeFilterType.TwoDays),
  SortFilterTypeItem(label: "3日", type: TimeFilterType.ThreeDays),
  SortFilterTypeItem(label: "4日", type: TimeFilterType.FourDays),
  SortFilterTypeItem(label: "5日", type: TimeFilterType.FiveDays),
  SortFilterTypeItem(label: "6日", type: TimeFilterType.SixDays),
  SortFilterTypeItem(label: "1週間", type: TimeFilterType.OneWeek),
  SortFilterTypeItem(label: "All", type: TimeFilterType.All),
];

typedef SortFilterDialogCallback = void Function(SortFilterStateStore store);

class _SortFilterListData {
  _SortFilterListData(
      {required this.itemCount,
      required this.itemLabels,
      required this.selectedItemIndex});

  final int itemCount;
  final List<String> itemLabels;
  final int selectedItemIndex;
}

class SortFilterDialog extends StatefulWidget {
  const SortFilterDialog({
    Key? key,
    required this.store,
    required this.onChange,
  }) : super(key: key);

  final SortFilterStateStore store;
  final SortFilterDialogCallback onChange;

  @override
  State<StatefulWidget> createState() => SortFilterDialogState();
}

class SortFilterStateStore {
  SortFilterStateStore({
    required this.sortType,
    this.friendFilterType,
    this.timeFilterType,
  });

  final SortType sortType;
  final FriendsFilterType? friendFilterType;
  final TimeFilterType? timeFilterType;

  SortFilterStateStore convert(int selectedSegmentIndex, itemSelectedIndex) {
    var currentSortType = this.sortType;
    var currentFriendsFilterType = this.friendFilterType;
    var currentTimeFilterType = this.timeFilterType;

    if (selectedSegmentIndex == _SortFilterSegmentType.Sort.index) {
      currentSortType = sortTypeItems.firstWhere((item) {
        var type = item.type as SortType;
        return type.index == itemSelectedIndex;
      }).type;
    }

    if (currentSortType == SortType.FriendsNumber) {
      currentTimeFilterType = timeFilterItems.firstWhere((item) {
        var type = item.type as TimeFilterType;
        return type.index == itemSelectedIndex;
      }).type;
    } else {
      currentFriendsFilterType = friendsFilterItems.firstWhere((item) {
        var type = item.type as FriendsFilterType;
        return type.index == itemSelectedIndex;
      }).type;
    }

    return SortFilterStateStore(
        sortType: currentSortType,
        friendFilterType: currentFriendsFilterType,
        timeFilterType: currentTimeFilterType);
  }
}

class SortFilterTypeItem {
  SortFilterTypeItem({required this.label, required this.type});

  final String label;
  final dynamic type;
}

class SortFilterDialogState extends State<SortFilterDialog> {
  var _isSegmentSelected = [true, false];

  int get _selectedSegmentIndex {
    return _isSegmentSelected.indexOf(true);
  }

  _SortFilterListData get _listItemData {
    if (_selectedSegmentIndex == _SortFilterSegmentType.Sort.index) {
      return _SortFilterListData(
          itemCount: sortTypeItems.length,
          itemLabels: sortTypeItems.map((item) => item.label).toList(),
          selectedItemIndex: widget.store.sortType.index);
    }

    if (widget.store.sortType == SortType.FriendsNumber) {
      return _SortFilterListData(
          itemCount: timeFilterItems.length,
          itemLabels: timeFilterItems.map((item) => item.label).toList(),
          selectedItemIndex: widget.store.timeFilterType!.index);
    }

    return _SortFilterListData(
        itemCount: friendsFilterItems.length,
        itemLabels: friendsFilterItems.map((item) => item.label).toList(),
        selectedItemIndex: widget.store.friendFilterType!.index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: 100),
          width: MediaQuery.of(context).size.width * 6 / 7,
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: ToggleButtons(
                          isSelected: _isSegmentSelected,
                          borderRadius: BorderRadius.circular(5.0),
                          selectedColor: Colors.white,
                          fillColor: Colors.blueGrey[400],
                          selectedBorderColor: Colors.blueGrey[400],
                          children: [
                            Container(
                              width: 100,
                              child: Center(child: Text("Sort by")),
                            ),
                            Container(
                              width: 100,
                              child: Center(child: Text("Filter by")),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < _isSegmentSelected.length;
                                  buttonIndex++) {
                                _isSegmentSelected[buttonIndex] =
                                    buttonIndex == index;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemCount: _listItemData.itemCount,
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 1,
                          );
                        },
                        itemBuilder: (context, index) {
                          final label = _listItemData.itemLabels[index];
                          final selectedItemIndex =
                              _listItemData.selectedItemIndex;
                          return ListTile(
                              title: Text(label),
                              trailing: (index == selectedItemIndex)
                                  ? Icon(Icons.check_sharp)
                                  : null,
                              dense: true,
                              onTap: () {
                                var currentSortType = widget.store.sortType;
                                var currentTimeFilterType =
                                    widget.store.timeFilterType;
                                var currentFriendsFilterType =
                                    widget.store.friendFilterType;

                                final store = SortFilterStateStore(
                                    sortType: currentSortType,
                                    timeFilterType: currentTimeFilterType,
                                    friendFilterType: currentFriendsFilterType);
                                widget.onChange(store.convert(_selectedSegmentIndex, index));
                                Navigator.of(context).pop();
                              });
                        })
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
