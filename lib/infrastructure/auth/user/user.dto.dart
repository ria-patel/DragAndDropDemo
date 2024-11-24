// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user.dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: 'email_address')
  final String email;
  final String name;
  @JsonKey(name: 'user_id')
  final int userId;

  UserDto({
    required this.email,
    required this.name,
    required this.userId,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
