import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_checkout/core/utils/app_color.dart';
import 'package:payment_checkout/core/utils/app_style.dart';

class ParCode extends StatelessWidget {
  const ParCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.barcode, size: 90),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.green, width: 1.5),
            ),
            child: Center(child: Text('PAID', style: AppStyle.semiBold24Green)),
          ),
        ],
      ),
    );
  }
}
