import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_style.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key, required this.title, required this.subTitle});
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppStyle.regular18black),
        Spacer(),
        Text(subTitle, style: AppStyle.semiBild24black.copyWith(fontSize: 18)),
      ],
    );
  }
}
