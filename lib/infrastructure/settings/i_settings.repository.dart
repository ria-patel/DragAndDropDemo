// Dart imports:
import 'dart:async';

// Package imports:
import 'package:app_demo/domain/core/constants/collection.constants.dart';
import 'package:app_demo/domain/core/constants/hive.constants.dart';
import 'package:app_demo/infrastructure/settings/dtos/settings.dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:app_demo/domain/core/constants/string.constants.dart';
import 'package:app_demo/domain/settings/settings.repository.dart';

@LazySingleton(as: SettingsRepository)
class ISettingsRepository extends SettingsRepository {
  final FirebaseFirestore _firestore;

  ISettingsRepository(this._firestore);

  var box = Hive.box(HiveConstants.hiveBox);

  @override
  Future<Either<String, bool>> createSetting(SettingsDto settingsDto) async {
    final userId = box.get(HiveConstants.userId,defaultValue: 1231);
    try {
      final docRef = _firestore
          .collection(CollectionConstants.settings)
          .doc(userId.toString());

      await docRef.set(settingsDto.toJson());
      return right(true);
    } catch (e) {
      return left(StringConstants.somethingWentWrong);
    }
  }

  @override
  Future<Either<String, SettingsDto>> retrieveSetting() async {
    final userId = box.get(HiveConstants.userId,defaultValue: 1231);
    try {
      final docRef =
          _firestore.collection(CollectionConstants.settings).doc(userId.toString());

      DocumentSnapshot documentSnapshot = await docRef.get();
      if (documentSnapshot.exists) {
        Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;
        if ((data ?? {}).isNotEmpty) {
          SettingsDto settingsDto = SettingsDto.fromJson(data!);
          return right(settingsDto);
        }
        return left(StringConstants.noDataFound);
      } else {
        return left(StringConstants.documentNotExist);
      }
    } catch (e) {
      return left(StringConstants.somethingWentWrong);
    }
  }

  @override
  Future<Either<String, bool>> updateSetting() async {
    // final userId = box.get(HiveConstants.userId);
    try {
      return right(true);
    } catch (e) {
      return left(StringConstants.somethingWentWrong);
    }
  }
}
