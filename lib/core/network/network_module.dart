import 'package:dio/dio.dart';
import 'package:hungry_app/data/data_source/auth/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthLocalDataSource authLocalDataSource) {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://sonic-zdi0.onrender.com/api/",
        headers: {"Accept": "application/json"},
        followRedirects: true,
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await authLocalDataSource.getToken();

          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}
