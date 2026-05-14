import 'package:flutter/material.dart';

import 'package:payment_checkout/core/utils/app_routes.dart';
import 'package:payment_checkout/core/widgets/custom_appbar.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/credit_card.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/custom_button.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/payment_details_list_view.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          title: "Payment Details",
          onTap: () {
            Navigator.push(context, AppRoute.myCard);
          },
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                SizedBox(height: 32),
                PaymentDetailsListView(),
                SizedBox(height: 32),
                CreditCard(),
                SizedBox(height: 100), // space for button
              ],
            ),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomButtom(
            title: 'Pay',
            onTap: () {
              Navigator.push(context, AppRoute.thankYouView);
            },
          ),
        ),
      ),
    );
  }
}
