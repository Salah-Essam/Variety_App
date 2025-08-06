import 'package:dio/dio.dart';
import 'package:variety_app/core/remote/api_constants.dart';

class ApiService {
  static final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        requestBody: true,
        responseBody: true,
        request: true,
      ),
    );
  }

  Future<Response> get({required String path}) async {
    try {
      return await _dio.get(path);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete({required String path}) async {
    try {
      return await _dio.delete(path);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post({required String path, required dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> update({required String path, required dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
