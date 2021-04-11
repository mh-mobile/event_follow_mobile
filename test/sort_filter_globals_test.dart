import 'package:event_follow/config/sort_filter_globals.dart';
import 'package:test/test.dart';

void main() {
  group('SortTypeExtension', () {
    test('typeNames', () {
      expect(SortTypeExtension.typeNames.length, 4);
      expect(SortTypeExtension.typeNames[SortType.friendsNumber],
          'friends_number_order');
      expect(SortTypeExtension.typeNames[SortType.recentOrder], 'recent_order');
      expect(
          SortTypeExtension.typeNames[SortType.createdOrder], 'created_order');
      expect(SortTypeExtension.typeNames[SortType.closenessOrder],
          'closeness_order');
    });

    test('labelNames', () {
      expect(SortTypeExtension.labelNames.length, 4);
      expect(SortTypeExtension.labelNames[SortType.friendsNumber], 'Friend数');
      expect(SortTypeExtension.labelNames[SortType.recentOrder], '新着順');
      expect(SortTypeExtension.labelNames[SortType.createdOrder], '投稿順');
      expect(SortTypeExtension.labelNames[SortType.closenessOrder], '開催が近い順');
    });

    test('convert', () {
      expect(SortTypeExtension.convert('friends_number_order'),
          SortType.friendsNumber);
      expect(SortTypeExtension.convert('recent_order'), SortType.recentOrder);
      expect(SortTypeExtension.convert('created_order'), SortType.createdOrder);
      expect(SortTypeExtension.convert('closeness_order'),
          SortType.closenessOrder);
    });
  });

  group('FriendsFilterType', () {
    test('typeNames', () {
      expect(FriendsFilterTypeExtension.typeNames.length, 5);
      expect(
          FriendsFilterTypeExtension
              .typeNames[FriendsFilterType.oneOrMoreFriends],
          'one_or_more_friends');
      expect(
          FriendsFilterTypeExtension
              .typeNames[FriendsFilterType.twoOrMoreFriends],
          'two_or_more_friends');
      expect(
          FriendsFilterTypeExtension
              .typeNames[FriendsFilterType.threeOrMoreFriends],
          'three_or_more_friends');
      expect(
          FriendsFilterTypeExtension
              .typeNames[FriendsFilterType.fourOrMoreFriends],
          'four_or_more_friends');
      expect(
          FriendsFilterTypeExtension
              .typeNames[FriendsFilterType.fiveOrMoreFriends],
          'five_or_more_friends');
    });

    test('labelNames', () {
      expect(FriendsFilterTypeExtension.labelNames.length, 5);
      expect(
          FriendsFilterTypeExtension
              .labelNames[FriendsFilterType.oneOrMoreFriends],
          'Friends 1+');
      expect(
          FriendsFilterTypeExtension
              .labelNames[FriendsFilterType.twoOrMoreFriends],
          'Friends 2+');
      expect(
          FriendsFilterTypeExtension
              .labelNames[FriendsFilterType.threeOrMoreFriends],
          'Friends 3+');
      expect(
          FriendsFilterTypeExtension
              .labelNames[FriendsFilterType.fourOrMoreFriends],
          'Friends 4+');
      expect(
          FriendsFilterTypeExtension
              .labelNames[FriendsFilterType.fiveOrMoreFriends],
          'Friends 5+');
    });

    test('convert', () {
      expect(FriendsFilterTypeExtension.convert('one_or_more_friends'),
          FriendsFilterType.oneOrMoreFriends);
      expect(FriendsFilterTypeExtension.convert('two_or_more_friends'),
          FriendsFilterType.twoOrMoreFriends);
      expect(FriendsFilterTypeExtension.convert('three_or_more_friends'),
          FriendsFilterType.threeOrMoreFriends);
      expect(FriendsFilterTypeExtension.convert('four_or_more_friends'),
          FriendsFilterType.fourOrMoreFriends);
      expect(FriendsFilterTypeExtension.convert('five_or_more_friends'),
          FriendsFilterType.fiveOrMoreFriends);
    });
  });

  group('TimeFilterType', () {
    test('typeNames', () {
      expect(TimeFilterTypeExtension.typeNames.length, 9);
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.eightHours],
          'past_8_hours');
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.twentyFourHour],
          'past_24_hours');
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.twoDays],
          'past_2_days');
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.threeDays],
          'past_3_days');
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.fourDays],
          'past_4_days');
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.fiveDays],
          'past_5_days');
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.sixDays],
          'past_6_days');
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.oneWeek],
          'past_1_weeks');
      expect(TimeFilterTypeExtension.typeNames[TimeFilterType.all], 'past_all');
    });

    test('labelNames', () {
      expect(TimeFilterTypeExtension.labelNames.length, 9);
      expect(TimeFilterTypeExtension.labelNames[TimeFilterType.eightHours],
          '過去8時間');
      expect(TimeFilterTypeExtension.labelNames[TimeFilterType.twentyFourHour],
          '過去24時間');
      expect(
          TimeFilterTypeExtension.labelNames[TimeFilterType.twoDays], '過去2日');
      expect(
          TimeFilterTypeExtension.labelNames[TimeFilterType.threeDays], '過去3日');
      expect(
          TimeFilterTypeExtension.labelNames[TimeFilterType.fourDays], '過去4日');
      expect(
          TimeFilterTypeExtension.labelNames[TimeFilterType.fiveDays], '過去5日');
      expect(
          TimeFilterTypeExtension.labelNames[TimeFilterType.sixDays], '過去6日');
      expect(
          TimeFilterTypeExtension.labelNames[TimeFilterType.oneWeek], '過去1週間');
      expect(TimeFilterTypeExtension.labelNames[TimeFilterType.all], 'all');
    });

    test('convert', () {
      expect(TimeFilterTypeExtension.convert('past_8_hours'),
          TimeFilterType.eightHours);
      expect(TimeFilterTypeExtension.convert('past_24_hours'),
          TimeFilterType.twentyFourHour);
      expect(TimeFilterTypeExtension.convert('past_2_days'),
          TimeFilterType.twoDays);
      expect(TimeFilterTypeExtension.convert('past_3_days'),
          TimeFilterType.threeDays);
      expect(TimeFilterTypeExtension.convert('past_4_days'),
          TimeFilterType.fourDays);
      expect(TimeFilterTypeExtension.convert('past_5_days'),
          TimeFilterType.fiveDays);
      expect(TimeFilterTypeExtension.convert('past_6_days'),
          TimeFilterType.sixDays);
      expect(TimeFilterTypeExtension.convert('past_1_weeks'),
          TimeFilterType.oneWeek);
      expect(TimeFilterTypeExtension.convert('past_all'), TimeFilterType.all);
    });
  });
}
