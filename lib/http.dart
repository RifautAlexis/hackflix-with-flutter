import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Http {
  static Http? _instance;
  late Dio _dio;
  BaseOptions? _options;

  Http._internal() {
    _options = BaseOptions(
        baseUrl: env['API_URL']!,
        queryParameters: {"api_key": env['API_KEY']});

    _dio = Dio(_options);

    _instance = this;
  }

  factory Http() => _instance ?? Http._internal();

  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(url, queryParameters: queryParameters);
  }

  Future<dynamic> post(String url,
      {dynamic body, Map<String, dynamic>? queryParameters}) async {
    return await _dio.post(url, data: body, queryParameters: queryParameters);
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.put(url, queryParameters: queryParameters);
  }

  Future<dynamic> delete(String url,
      {dynamic body, Map<String, dynamic>? queryParameters}) async {
    return await _dio.delete(url, data: body, queryParameters: queryParameters);
  }
}
