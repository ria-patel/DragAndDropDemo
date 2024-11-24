// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      email: json['email_address'] as String,
      name: json['name'] as String,
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'email_address': instance.email,
      'name': instance.name,
      'user_id': instance.userId,
    };
