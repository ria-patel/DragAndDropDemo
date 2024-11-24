// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  String get apiBaseUrl => dotenv.env['API_BASE_URL'].toString();
}
