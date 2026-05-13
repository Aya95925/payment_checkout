

import 'package:flutter/material.dart';

import 'package:payment_checkout/core/utils/app_routes.dart';
import 'package:payment_checkout/core/widgets/custom_appbar.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [SizedBox(height: 32), PaymentDetailsListView()],
          ),
        ),
      ),
    );
  }
}



