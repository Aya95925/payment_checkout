import 'package:flutter/material.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/my_card.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/payment.dart';

abstract final class AppRoute {
  static MaterialPageRoute get paymentDetails =>
      MaterialPageRoute(builder: (context) => const Payment());
  static MaterialPageRoute get myCard =>
      MaterialPageRoute(builder: (context) => const MyCard());
}
