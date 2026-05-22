import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_checkout/core/utils/app_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  @singleton
  Dio createDio() {
     var dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return dio;
  }
}
