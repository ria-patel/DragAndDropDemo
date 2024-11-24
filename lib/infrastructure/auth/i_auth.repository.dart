// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:app_demo/domain/auth/auth.repository.dart';
import 'package:app_demo/domain/core/constants/api.constants.dart';
import 'package:app_demo/domain/core/constants/hive.constants.dart';
import 'package:app_demo/domain/core/constants/string.constants.dart';
import 'package:app_demo/domain/core/services/api/api_type.enum.dart';
import 'package:app_demo/domain/core/services/api/rest.service.dart';
import 'package:app_demo/infrastructure/auth/user/user.dto.dart';

@LazySingleton(as: AuthRepository)
class IAuthRepository extends AuthRepository {
  final String _apiBaseUrl;

  IAuthRepository(this._apiBaseUrl);

  @override
  Future<Either<String, UserDto>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await RestService.requestAPI(
        httpUrl: _apiBaseUrl + UserAPI.login,
        apiType: APIType.POST,
        body: jsonEncode(
          {
            'email_address': email,
            'password': password,
          },
        ),
      );
      Map<String, dynamic> body = jsonDecode(response.body);
      final data = body['data'];
      var box = Hive.box(HiveConstants.hiveBox);
      box.put(HiveConstants.token, data['access_token']);
      return right(UserDto.fromJson(data['user']));
    } catch (err) {
      if (err is Response) {
        Map<String, dynamic> data = jsonDecode(err.body);
        return left(data['error']['code']);
      }
      return left(StringConstants.somethingWentWrong);
    }
  }
}
