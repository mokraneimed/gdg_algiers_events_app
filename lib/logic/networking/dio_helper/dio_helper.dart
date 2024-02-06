import 'package:dio/dio.dart';

import 'package:gdg_algiers_events_app/constants/endpoints.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl, // the base url of the api
        receiveDataWhenStatusError: true,
        connectTimeout: 20000,
        receiveTimeout: 20000,
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String language = 'en',
  }) async {
    dio.options.headers = {
      'lang': language,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
    String language = 'en',
  }) async {
    dio.options.headers = {
      'lang': language,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
