import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:payment_checkout/core/error/failures.dart';

import 'package:payment_checkout/feature/checkout/data/repo/check_out_repo.dart';

import 'package:payment_checkout/feature/checkout/data/data_source/remote_data_source.dart';

import 'package:payment_checkout/feature/network/model/payment_intent_input_model.dart';

@Injectable(as: CheckOutRepo)
class CheckoutRepoImpl extends CheckOutRepo {
  final RemoteDataSource _remoteDataSource;

  CheckoutRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    return await _remoteDataSource.makpayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
  }
}
