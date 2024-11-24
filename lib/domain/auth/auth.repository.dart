// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:app_demo/infrastructure/auth/user/user.dto.dart';

abstract class AuthRepository {
  Future<Either<String, UserDto>> loginUser({
    required String email,
    required String password,
  });
}
