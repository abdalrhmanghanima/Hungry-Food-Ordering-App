import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {

  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://sonic-zdi0.onrender.com/api/",
        headers: {
          "Accept": "application/json",
        },
        followRedirects: true,
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  }
}