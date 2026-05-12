import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentCheckout());
}

class PaymentCheckout extends StatelessWidget {
  const PaymentCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false);
  }
}
