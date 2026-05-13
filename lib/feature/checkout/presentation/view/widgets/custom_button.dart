import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_color.dart';
import 'package:payment_checkout/core/utils/app_style.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.title, this.onTap});
  final String title;
   final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * .08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.green,
        ),
        child: Center(child: Text(title, style: AppStyle.medium22Black)),
      ),
    );
  }
}
