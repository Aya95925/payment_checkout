import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_color.dart';
import 'package:payment_checkout/core/utils/app_style.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/par_code.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/payment_info.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text('Thank you!', style: AppStyle.medium25Black),
            Text(
              'Your transaction was successful',
              style: AppStyle.regular20black,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const PaymentInfo(title: 'Date', subTitle: '01/24/2023'),
            const SizedBox(height: 12),
            const PaymentInfo(title: 'Time', subTitle: '10:15 AM'),
            const SizedBox(height: 12),
            const PaymentInfo(title: 'To', subTitle: 'Sam Louis'),
            const SizedBox(height: 14),
            Divider(color: AppColor.dividergrey, thickness: 2),
            const SizedBox(height: 14),
            const TotalPrice(total: 'Total', price: r'$50.97'),

            const SizedBox(height: 30),

            // تم حذف CustomContainerCridetCard من هنا
            const Spacer(),

            const ParCode(),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
