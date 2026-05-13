
import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_style.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.title, required this.price});
  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppStyle.regular18black),
        Spacer(),
        Text(price, style: AppStyle.regular18black),
      ],
    );
  }
}