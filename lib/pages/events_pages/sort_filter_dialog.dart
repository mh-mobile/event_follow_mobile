import 'package:event_follow/config/sort_filter_globals.dart';
import 'package:flutter/material.dart';

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

class SortFilterDialogState extends State<SortFilterDialog> {
  var _isSegmentSelected = [true, false];

  int get _selectedSegmentIndex {
    return _isSegmentSelected.indexOf(true);
  }

  _SortFilterListData get _listItemData {
    if (_selectedSegmentIndex == SortFilterSegmentType.Sort.index) {
      return _SortFilterListData(
          itemCount: SortTypeExtension.types.length,
          itemLabels: SortTypeExtension.types.map((type) => type.labelName).toList(),
          selectedItemIndex: widget.store.sortType.index);
    }

    if (widget.store.sortType == SortType.FriendsNumber) {
      return _SortFilterListData(
          itemCount: TimeFilterTypeExtension.types.length,
          itemLabels: TimeFilterTypeExtension.types.map((type) => type.labelName).toList(),
          selectedItemIndex: widget.store.timeFilterType!.index);
    }

    return _SortFilterListData(
        itemCount: FriendsFilterTypeExtension.types.length,
        itemLabels: FriendsFilterTypeExtension.types.map((type) => type.labelName).toList(),
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
