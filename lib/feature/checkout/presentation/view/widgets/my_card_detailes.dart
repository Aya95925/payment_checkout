import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_assets.dart';
import 'package:payment_checkout/core/utils/app_color.dart';
import 'package:payment_checkout/core/utils/app_routes.dart';

import 'package:payment_checkout/core/widgets/custom_appbar.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/custom_button.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/order_details.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/total_price.dart';

class MyCardDetailes extends StatelessWidget {
  const MyCardDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(title: 'My Card'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Expanded(flex: 4, child: Image.asset(AppAssets.basket)),
              const SizedBox(height: 25),
              const OrderDetails(title: 'Order Subtotal', price: r'$42.97'),
              const SizedBox(height: 3),
              const OrderDetails(title: 'Discount', price: r'$0'),
              const SizedBox(height: 3),
              const OrderDetails(title: 'Shipping', price: r'$8'),
              const SizedBox(height: 23),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(thickness: 2, color: AppColor.dividergrey),
              ),
              const SizedBox(height: 15),
              const TotalPrice(total: 'Total', price: r'$42.97'),
              const Spacer(),
              CustomButtom(
                title: 'Complete Payment',
                onTap: () {
                  Navigator.push(context, AppRoute.paymentDetails);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
