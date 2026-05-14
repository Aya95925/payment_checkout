import 'package:flutter/material.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/my_card_view.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/payment_view.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/thank_you_view.dart';

abstract final class AppRoute {
  static MaterialPageRoute get paymentDetails =>
      MaterialPageRoute(builder: (context) => const PaymentView());
  static MaterialPageRoute get myCard =>
      MaterialPageRoute(builder: (context) => const MyCardView());
        static MaterialPageRoute get thankYouView =>
      MaterialPageRoute(builder: (context) => const ThankYouView());
}
