import 'package:event_follow/config/sort_filter_globals.dart';
import 'package:event_follow/models/controllers/events_controller/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

final sortFilterSelectedSegmentsProvider =
    StateProvider.autoDispose<List<bool>>((ref) => [true, false]);

class SortFilterDialog extends HookWidget {
  const SortFilterDialog({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final SortFilterDialogCallback onChange;

  int _selectedSegmentIndex(List<bool> isSegmentSelected) {
    return isSegmentSelected.indexOf(true);
  }

  _SortFilterListData _listItemData(
      SortFilterStateStore store, List<bool> isSegmentSelected) {
    if (_selectedSegmentIndex(isSegmentSelected) ==
        SortFilterSegmentType.Sort.index) {
      return _SortFilterListData(
          itemCount: SortTypeExtension.types.length,
          itemLabels:
              SortTypeExtension.types.map((type) => type.labelName).toList(),
          selectedItemIndex: store.sortType.index);
    }

    if (store.sortType == SortType.FriendsNumber) {
      return _SortFilterListData(
          itemCount: TimeFilterTypeExtension.types.length,
          itemLabels: TimeFilterTypeExtension.types
              .map((type) => type.labelName)
              .toList(),
          selectedItemIndex: store.timeFilterType!.index);
    }

    return _SortFilterListData(
        itemCount: FriendsFilterTypeExtension.types.length,
        itemLabels: FriendsFilterTypeExtension.types
            .map((type) => type.labelName)
            .toList(),
        selectedItemIndex: store.friendFilterType!.index);
  }

  @override
  Widget build(BuildContext context) {
    final sortFilterStateStore = useProvider(eventsConditionProvider).state;
    final sortFilterSelectedSegments =
        useProvider(sortFilterSelectedSegmentsProvider).state;

    if (sortFilterStateStore == null) {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 100),
          width: MediaQuery.of(context).size.width * 6 / 7,
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: ToggleButtons(
                          isSelected: sortFilterSelectedSegments,
                          borderRadius: BorderRadius.circular(5),
                          selectedColor: Colors.white,
                          fillColor: Colors.blueGrey[400],
                          selectedBorderColor: Colors.blueGrey[400],
                          onPressed: (int index) {
                            for (var buttonIndex = 0;
                                buttonIndex < sortFilterSelectedSegments.length;
                                buttonIndex++) {
                              sortFilterSelectedSegments[buttonIndex] =
                                  buttonIndex == index;
                              context
                                  .read(sortFilterSelectedSegmentsProvider)
                                  .state = sortFilterSelectedSegments;
                            }
                          },
                          children: const [
                            SizedBox(
                              width: 100,
                              child: Center(child: Text('Sort by')),
                            ),
                            SizedBox(
                              width: 100,
                              child: Center(child: Text('Filter by')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemCount: _listItemData(sortFilterStateStore,
                                sortFilterSelectedSegments)
                            .itemCount,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 1,
                          );
                        },
                        itemBuilder: (context, index) {
                          final label = _listItemData(sortFilterStateStore,
                                  sortFilterSelectedSegments)
                              .itemLabels[index];
                          final selectedItemIndex = _listItemData(
                                  sortFilterStateStore,
                                  sortFilterSelectedSegments)
                              .selectedItemIndex;
                          return ListTile(
                              title: Text(label),
                              trailing: (index == selectedItemIndex)
                                  ? const Icon(Icons.check_sharp)
                                  : null,
                              dense: true,
                              onTap: () {
                                final currentSortType =
                                    sortFilterStateStore.sortType;
                                final currentTimeFilterType =
                                    sortFilterStateStore.timeFilterType;
                                final currentFriendsFilterType =
                                    sortFilterStateStore.friendFilterType;

                                final store = SortFilterStateStore(
                                    sortType: currentSortType,
                                    timeFilterType: currentTimeFilterType,
                                    friendFilterType: currentFriendsFilterType);

                                final convertedStore = store.convert(
                                    _selectedSegmentIndex(
                                        sortFilterSelectedSegments),
                                    index);

                                context.read(eventsConditionProvider).state =
                                    convertedStore;
                                onChange(convertedStore);
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
