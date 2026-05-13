import 'package:flutter/material.dart';
import 'package:payment_checkout/feature/checkout/presentation/my_card.dart';

void main() {
  runApp(const PaymentCheckout());
}

class PaymentCheckout extends StatelessWidget {
  const PaymentCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCard());
  }
}
