import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_checkout/core/utils/api_keys.dart';
import 'package:payment_checkout/core/utils/api_service.dart';
import 'package:payment_checkout/feature/network/model/payment_intent_input_model.dart';
import 'package:payment_checkout/feature/network/model/remote_payment_intent_model/remote_payment_intent_model.dart';

@LazySingleton()
class StripeSevice {
  final ApiService _apiService;

  StripeSevice(this._apiService);
  Future<RemotePaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentImtentInputModel,
  }) async {
    var response = await _apiService.post(
      url: '/payment_intents',
      token: ApiKeys.secretKet,
      body: paymentImtentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType
    );
    var paymentIntentModel = RemotePaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Aya Ahmed',
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePaymentSheet({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(
      paymentImtentInputModel: paymentIntentInputModel,
    );
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
   await presentPaymentSheet();
  }
}
