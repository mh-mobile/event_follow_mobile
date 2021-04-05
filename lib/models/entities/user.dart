import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User implements _$User {
  factory User({
    required String id,
    required String screenName,
    required String name,
    required String profileImage,
  }) = _User;

  User._();

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        screenName: json['screen_name'] as String,
        name: json['name'] as String,
        profileImage: json['profile_image'] as String,
      );
}
