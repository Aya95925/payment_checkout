import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_color.dart';
import 'package:payment_checkout/core/utils/app_style.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/custom_container_cridet_card.dart';
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
          children: [
            SizedBox(height: 80),
            Text('Thank you!', style: AppStyle.medium25Black),
            Text(
              'Your transaction was successful',
              style: AppStyle.regular20black,
            ),
            SizedBox(height: 42),
            PaymentInfo(title: 'Date', subTitle: '01/24/2023'),
            SizedBox(height: 20),
            PaymentInfo(title: 'Time', subTitle: '10:15 AM'),
            SizedBox(height: 20),
            PaymentInfo(title: 'To', subTitle: 'Sam Louis'),
            SizedBox(height: 30),
            Divider(color: AppColor.dividergrey, thickness: 2),
            SizedBox(height: 24),
            TotalPrice(total: 'Total', price: r'$50.97'),
            SizedBox(height: 30),
            CustomContainerCridetCard(),
            Spacer(),
            ParCode(),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

