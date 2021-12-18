import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const ts = '1';
const apiKey = '92e9bd6d0076131b88a6fdd59dc5b77f';
const hash = 'ed5a1e9d0bae7b175fffffa029340898';

class BaseService {
  late Dio _dio;
  final _baseUrl = 'https://gateway.marvel.com/';
  final queryParameters = {'ts': ts, 'apikey': apiKey, 'hash': hash};

  BaseService() {
    _dio =
        Dio(BaseOptions(baseUrl: _baseUrl, queryParameters: queryParameters));
    _initInterceptors();
  }

  void _initInterceptors() {
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: false,
        maxWidth: 90));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }
}
