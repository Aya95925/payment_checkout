import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_checkout/core/error/failures.dart';
import 'package:payment_checkout/core/utils/stripe_sevice.dart';
import 'package:payment_checkout/feature/checkout/data/data_source/remote_data_source.dart';
import 'package:payment_checkout/feature/network/model/payment_intent_input_model.dart';

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl extends RemoteDataSource {
  final StripeSevice _stripeSevice;

  RemoteDataSourceImpl(this._stripeSevice);
  @override
  Future<Either<Failure, void>> makpayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await _stripeSevice.makePaymentSheet(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Something went wrong'));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
