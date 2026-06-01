import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_checkout/core/utils/api_keys.dart';
import 'package:payment_checkout/core/utils/api_service.dart';
import 'package:payment_checkout/feature/network/model/ephemeral_key/ephemeral_key.dart';
import 'package:payment_checkout/feature/network/model/init_payment_sheet_input_model.dart';
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
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentIntentModel = RemotePaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet({
   required InitPaymentSheetInputModel initPaymentSheetInputModel
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.paymentIntentClientSecret,
        merchantDisplayName: 'Aya Ahmed',
        customerEphemeralKeySecret:initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId
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
    var ephemeralKeyModel= await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    await initPaymentSheet(
       initPaymentSheetInputModel: InitPaymentSheetInputModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
         ephemeralKeySecret:ephemeralKeyModel.secret??'' ,
          customerId: paymentIntentInputModel.customerId),
    );
    await presentPaymentSheet();
  }

  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    var response = await _apiService.post(
      url: '/ephemeral_keys',
      token: ApiKeys.secretKet,
      body: {'customer': customerId},
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKet}",
        'Stripe-Version': '2026-04-22.dahlia',
      },
    );
    var ephemralKey = EphemeralKey.fromJson(response.data);
    return ephemralKey;
  }
}
