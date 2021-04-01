import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_extra.freezed.dart';
part 'event_extra.g.dart';

@freezed
abstract class EventExtra implements _$EventExtra {
  factory EventExtra({
    required String userIds,
    required int friendsNumber,
  }) = _EventExtra;

  EventExtra._();

  factory EventExtra.fromJson(Map<String, dynamic> json) => EventExtra(
    userIds: json["user_ids"],
    friendsNumber: json["friends_number"],
  );
}
