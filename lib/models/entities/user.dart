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
        id: json["id"],
        screenName: json["screen_name"],
        name: json["name"],
        profileImage: json["profile_image"],
      );
}
