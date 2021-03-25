enum SortType {
  FriendsNumber,
  RecentOrder,
  CreatedOrder,
  ClosenessOrder,
}

extension SortTypeExtension on SortType {
  static final typeNames = {
    SortType.FriendsNumber: "friends_number_order",
    SortType.RecentOrder: "recent_order",
    SortType.CreatedOrder: "created_order",
    SortType.ClosenessOrder: "closeness_order",
  };

  static final labelNames = {
    SortType.FriendsNumber: "Friend数",
    SortType.RecentOrder: "新着順",
    SortType.CreatedOrder: "投稿順",
    SortType.ClosenessOrder: "開催が近い順",
  };

  static final types = [
    SortType.FriendsNumber,
    SortType.RecentOrder,
    SortType.CreatedOrder,
    SortType.ClosenessOrder,
  ];

  String get typeName => typeNames[this]!;
  String get labelName => labelNames[this]!;
}

enum FriendsFilterType {
  OneOrMoreFriends,
  TwoOrMoreFriends,
  ThreeOrMoreFriends,
  FourOrMoreFriends,
  FiveOrMoreFriends,
}

extension FriendsFilterTypeExtension on FriendsFilterType {
  static final typeNames = {
    FriendsFilterType.OneOrMoreFriends: "one_or_more_friends",
    FriendsFilterType.TwoOrMoreFriends: "two_or_more_friends",
    FriendsFilterType.ThreeOrMoreFriends: "three_or_more_friends",
    FriendsFilterType.FourOrMoreFriends: "four_or_more_friends",
    FriendsFilterType.FiveOrMoreFriends: "five_or_more_friends",
  };

  static final labelNames = {
    FriendsFilterType.OneOrMoreFriends: "Friends 1+",
    FriendsFilterType.TwoOrMoreFriends: "Friends 2+",
    FriendsFilterType.ThreeOrMoreFriends: "Friends 3+",
    FriendsFilterType.FourOrMoreFriends: "Friends 4+",
    FriendsFilterType.FiveOrMoreFriends: "Friends 5+",
  };

  static final types = [
    FriendsFilterType.OneOrMoreFriends,
    FriendsFilterType.TwoOrMoreFriends,
    FriendsFilterType.ThreeOrMoreFriends,
    FriendsFilterType.FourOrMoreFriends,
    FriendsFilterType.FiveOrMoreFriends,
  ];

  String get typeName => typeNames[this]!;
  String get labelName => labelNames[this]!;
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

extension TimeFilterTypeExtension on TimeFilterType {
  static final typeNames = {
    TimeFilterType.EightHours: "past_8_hours",
    TimeFilterType.TwentyFourHour: "past_24_hours",
    TimeFilterType.TwoDays: "past_2_days",
    TimeFilterType.ThreeDays: "past_3_days",
    TimeFilterType.FourDays: "past_4_days",
    TimeFilterType.FiveDays: "past_5_days",
    TimeFilterType.SixDays: "past_6_days",
    TimeFilterType.OneWeek: "past_1_weeks",
    TimeFilterType.All: "past_all",
  };

  static final labelNames = {
    TimeFilterType.EightHours: "過去8時間",
    TimeFilterType.TwentyFourHour: "過去24時間",
    TimeFilterType.TwoDays: "過去2日",
    TimeFilterType.ThreeDays: "過去3日",
    TimeFilterType.FourDays: "過去4日",
    TimeFilterType.FiveDays: "過去5日",
    TimeFilterType.SixDays: "過去6日",
    TimeFilterType.OneWeek: "過去1週間",
    TimeFilterType.All: "All",
  };

  static final types = [
    TimeFilterType.EightHours,
    TimeFilterType.TwentyFourHour,
    TimeFilterType.TwoDays,
    TimeFilterType.ThreeDays,
    TimeFilterType.FourDays,
    TimeFilterType.FiveDays,
    TimeFilterType.SixDays,
    TimeFilterType.OneWeek,
    TimeFilterType.All,
  ];

  String get typeName => typeNames[this]!;
  String get labelName => labelNames[this]!;
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
      currentSortType = SortTypeExtension.types.firstWhere((type) {
        return type.index == itemSelectedIndex;
      });
    }

    if (currentSortType == SortType.FriendsNumber) {
      currentTimeFilterType = TimeFilterTypeExtension.types.firstWhere((type) {
        return type.index == itemSelectedIndex;
      });
    } else {
      currentFriendsFilterType =
          FriendsFilterTypeExtension.types.firstWhere((type) {
        return type.index == itemSelectedIndex;
      });
    }

    return SortFilterStateStore(
        sortType: currentSortType,
        friendFilterType: currentFriendsFilterType,
        timeFilterType: currentTimeFilterType);
  }
}

enum SortFilterSegmentType { Sort, Filter }
