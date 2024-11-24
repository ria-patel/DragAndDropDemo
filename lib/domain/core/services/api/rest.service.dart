// Package imports:
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:app_demo/domain/core/constants/hive.constants.dart';
import 'package:app_demo/domain/core/services/api/api_type.enum.dart';

class RestService {
  static Future<http.Response> requestAPI({
    required String httpUrl,
    required APIType apiType,
    bool isAuth = false,
    String contentType = 'application/json',
    String body = '',
    Map<String, String> header = const {},
    Map<String, String> param = const {},
  }) async {
    if (param.isNotEmpty) {
      httpUrl += paramParser(param: param);
    }
    Box box = Hive.box(HiveConstants.hiveBox);
    final request = http.Request(apiType.name, Uri.parse(httpUrl));
    final Map<String, String> headers = {'Content-Type': contentType};

    if (isAuth) {
      String token = box.get(HiveConstants.token);
      headers['Authorization'] = 'Bearer $token';
      if (header.isNotEmpty) {
        headers.addAll(header);
      }
    }
    if (header.isNotEmpty) {
      headers.addAll(header);
    }
    if (body.isNotEmpty) {
      request.body = body;
    }
    request.followRedirects = false;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final resultResponse = await http.Response.fromStream(response);
      return resultResponse;
    } else {
      final resultResponse = await http.Response.fromStream(response);
      throw resultResponse;
    }
  }

  static String paramParser({required Map<String, String> param}) {
    String parameter = '';
    for (String key in param.keys) {
      if (parameter.contains('?')) {
        parameter +=
            param[key] == null || param[key] == 'null' || param[key] == ''
                ? ''
                : '&$key=${param[key]}';
      } else {
        parameter +=
            param[key] == null || param[key] == 'null' || param[key] == ''
                ? ''
                : '?$key=${param[key]}';
      }
    }
    return parameter;
  }
}
