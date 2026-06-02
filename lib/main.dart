import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_checkout/core/di/di.dart';
import 'package:payment_checkout/core/utils/api_keys.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/my_card_view.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = ApiKeys.stripePublishKey;

  await Stripe.instance.applySettings();
  runApp(const PaymentCheckout());
}

class PaymentCheckout extends StatelessWidget {
  const PaymentCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCardView());
  }
}
