import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_style.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.total, required this.price});
  final String total, price;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(total, style:  AppStyle.semiBild24black),
        Spacer(),
        Text(price, style: AppStyle.semiBild24black),
      ],
    );
  }
}
