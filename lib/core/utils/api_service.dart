import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiService {
  final Dio _dio;

  ApiService(this._dio);
  Future<Response> post({
    required String url,
    required String token,
    Map<String,String> ? headers,
    String? contentType,
    required body,
  }) async {
    var response = await _dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: headers??{'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }
}
