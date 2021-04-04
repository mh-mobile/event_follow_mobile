enum SortType {
  friendsNumber,
  recentOrder,
  createdOrder,
  closenessOrder,
}

extension SortTypeExtension on SortType {
  static final typeNames = {
    SortType.friendsNumber: 'friends_number_order',
    SortType.recentOrder: 'recent_order',
    SortType.createdOrder: 'created_order',
    SortType.closenessOrder: 'closeness_order',
  };

  static final labelNames = {
    SortType.friendsNumber: 'Friend数',
    SortType.recentOrder: '新着順',
    SortType.createdOrder: '投稿順',
    SortType.closenessOrder: '開催が近い順',
  };

  static final types = [
    SortType.friendsNumber,
    SortType.recentOrder,
    SortType.createdOrder,
    SortType.closenessOrder,
  ];

  static final sortFilterButtonSortLabels = [
    ['Friend', '数'],
    ['新着', '順'],
    ['投稿', '順'],
    ['開催が近い', '順'],
  ];

  static SortType convert(String typeName) {
    return types.firstWhere((element) => typeNames[element] == typeName);
  }

  String get typeName => typeNames[this]!;
  String get labelName => labelNames[this]!;
}

enum FriendsFilterType {
  oneOrMoreFriends,
  twoOrMoreFriends,
  threeOrMoreFriends,
  fourOrMoreFriends,
  fiveOrMoreFriends,
}

extension FriendsFilterTypeExtension on FriendsFilterType {
  static final typeNames = {
    FriendsFilterType.oneOrMoreFriends: 'one_or_more_friends',
    FriendsFilterType.twoOrMoreFriends: 'two_or_more_friends',
    FriendsFilterType.threeOrMoreFriends: 'three_or_more_friends',
    FriendsFilterType.fourOrMoreFriends: 'four_or_more_friends',
    FriendsFilterType.fiveOrMoreFriends: 'five_or_more_friends',
  };

  static final labelNames = {
    FriendsFilterType.oneOrMoreFriends: 'Friends 1+',
    FriendsFilterType.twoOrMoreFriends: 'Friends 2+',
    FriendsFilterType.threeOrMoreFriends: 'Friends 3+',
    FriendsFilterType.fourOrMoreFriends: 'Friends 4+',
    FriendsFilterType.fiveOrMoreFriends: 'Friends 5+',
  };

  static final types = [
    FriendsFilterType.oneOrMoreFriends,
    FriendsFilterType.twoOrMoreFriends,
    FriendsFilterType.threeOrMoreFriends,
    FriendsFilterType.fourOrMoreFriends,
    FriendsFilterType.fiveOrMoreFriends,
  ];

  static final sortFilterButtonFriendsFilterLabels = [
    ['Friends', '1+'],
    ['Friends', '2+'],
    ['Friends', '3+'],
    ['Friends', '4+'],
    ['Friends', '5+'],
  ];

  static FriendsFilterType convert(String typeName) {
    return types.firstWhere((element) => typeNames[element] == typeName);
  }

  String get typeName => typeNames[this]!;
  String get labelName => labelNames[this]!;
}

enum TimeFilterType {
  eightHours,
  twentyFourHour,
  twoDays,
  threeDays,
  fourDays,
  fiveDays,
  sixDays,
  oneWeek,
  all,
}

extension TimeFilterTypeExtension on TimeFilterType {
  static final typeNames = {
    TimeFilterType.eightHours: 'past_8_hours',
    TimeFilterType.twentyFourHour: 'past_24_hours',
    TimeFilterType.twoDays: 'past_2_days',
    TimeFilterType.threeDays: 'past_3_days',
    TimeFilterType.fourDays: 'past_4_days',
    TimeFilterType.fiveDays: 'past_5_days',
    TimeFilterType.sixDays: 'past_6_days',
    TimeFilterType.oneWeek: 'past_1_weeks',
    TimeFilterType.all: 'past_all',
  };

  static final labelNames = {
    TimeFilterType.eightHours: '過去8時間',
    TimeFilterType.twentyFourHour: '過去24時間',
    TimeFilterType.twoDays: '過去2日',
    TimeFilterType.threeDays: '過去3日',
    TimeFilterType.fourDays: '過去4日',
    TimeFilterType.fiveDays: '過去5日',
    TimeFilterType.sixDays: '過去6日',
    TimeFilterType.oneWeek: '過去1週間',
    TimeFilterType.all: 'all',
  };

  static final types = [
    TimeFilterType.eightHours,
    TimeFilterType.twentyFourHour,
    TimeFilterType.twoDays,
    TimeFilterType.threeDays,
    TimeFilterType.fourDays,
    TimeFilterType.fiveDays,
    TimeFilterType.sixDays,
    TimeFilterType.oneWeek,
    TimeFilterType.all,
  ];

  static final sortFilterButtonTimeFilterLabels = [
    ['8', 'hrs'],
    ['24', 'hrs'],
    ['2', 'days'],
    ['3', 'days'],
    ['4', 'days'],
    ['5', 'days'],
    ['6', 'days'],
    ['1', 'week'],
    ['all'],
  ];

  static TimeFilterType convert(String typeName) {
    return types.firstWhere((element) => typeNames[element] == typeName);
  }

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
    var currentSortType = sortType;
    var currentFriendsFilterType = friendFilterType;
    var currentTimeFilterType = timeFilterType;

    if (selectedSegmentIndex == SortFilterSegmentType.sort.index) {
      currentSortType = SortTypeExtension.types.firstWhere((type) {
        return type.index == itemSelectedIndex;
      });

      return SortFilterStateStore(
          sortType: currentSortType,
          friendFilterType: currentFriendsFilterType,
          timeFilterType: currentTimeFilterType);
    }

    if (currentSortType == SortType.friendsNumber) {
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

enum SortFilterSegmentType { sort, filter }
