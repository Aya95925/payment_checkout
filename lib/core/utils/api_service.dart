import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();
  Future<Response> post({
    required String url,
    required String token,
    String? contentType,
    required body,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }
}
