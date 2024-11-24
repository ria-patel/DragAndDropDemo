// Package imports:
import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepository {
  Future<Either<String, bool>> createSetting(SettingsDto settingsDto);

  Future<Either<String, bool>> updateSetting();

  Future<Either<String, SettingsDto>> retrieveSetting();
}
