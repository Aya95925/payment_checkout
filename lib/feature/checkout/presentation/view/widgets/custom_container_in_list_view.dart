import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_checkout/core/utils/app_color.dart';

class CustomContainerInListView extends StatelessWidget {
  const CustomContainerInListView({
    super.key,
    required this.image,
    this.isCurrentIndex = false,
  });

  final String image;
  final bool isCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,

        height: isCurrentIndex ? 75 : 70,
        width: MediaQuery.sizeOf(context).width * .28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),

          border: Border.all(width: 1.5, color: Colors.grey),

          boxShadow: isCurrentIndex
              ? [BoxShadow(color: AppColor.green, blurRadius: 4)]
              : [],
        ),
        child: Center(
          child: SvgPicture.asset(image, fit: BoxFit.scaleDown, height: 32),
        ),
      ),
    );
  }
}
