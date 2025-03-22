import 'package:dio/dio.dart';
import 'package:pharmacy_app/core/database/api/api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});
  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    Map<String, String>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameter,
          options: Options(
            headers: headers ?? {},
          ));
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameter,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameter,
        options: Options(
          headers: headers ?? {},
        ),
      );
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
      return response;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  handleDioExceptions(e) {
    print(e.message); // I Will Handle this later 😑😑
  }
}
