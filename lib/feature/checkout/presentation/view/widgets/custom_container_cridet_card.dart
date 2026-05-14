import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_checkout/core/utils/app_assets.dart';
import 'package:payment_checkout/core/utils/app_color.dart';
import 'package:payment_checkout/core/utils/app_style.dart';

class CustomContainerCridetCard extends StatelessWidget {
  const CustomContainerCridetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .085,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.logo),
          SizedBox(width: 22),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Credit Card', style: AppStyle.regular18black),
              Text('Mastercard **78', style: AppStyle.regular16black),
            ],
          ),
        ],
      ),
    );
  }
}
