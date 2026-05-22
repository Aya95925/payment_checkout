import 'package:dartz/dartz.dart';
import 'package:payment_checkout/core/error/failures.dart';
import 'package:payment_checkout/feature/network/model/payment_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure,void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel });
}
