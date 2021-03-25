enum SortType {
  FriendsNumber,
  RecentOrder,
  CreatedOrder,
  ClosenessOrder,
}

enum FriendsFilterType {
  OneOrMoreFriends,
  TwoOrMoreFriends,
  ThreeOrMoreFriends,
  FourOrMoreFriends,
  FiveOrMoreFriends,
}

enum TimeFilterType {
  EightHours,
  TwentyFourHour,
  TwoDays,
  ThreeDays,
  FourDays,
  FiveDays,
  SixDays,
  OneWeek,
  All,
}

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

class SortFilterTypeItem {
  SortFilterTypeItem({required this.label, required this.type});

  final String label;
  final dynamic type;
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

    if (selectedSegmentIndex == SortFilterSegmentType.Sort.index) {
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

enum SortFilterSegmentType { Sort, Filter }