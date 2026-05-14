import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_color.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      left: 0,
      right: 0,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppColor.grey,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: AppColor.green,
          child: const Icon(
            Icons.check,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
