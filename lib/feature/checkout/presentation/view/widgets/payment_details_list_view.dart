import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/app_assets.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/custom_container_in_list_view.dart';


class PaymentDetailsListView extends StatefulWidget {
  const PaymentDetailsListView({super.key});

  @override
  State<PaymentDetailsListView> createState() => _PaymentDetailsListViewState();
}

class _PaymentDetailsListViewState extends State<PaymentDetailsListView> {
  final List<String> images = [AppAssets.cart, AppAssets.paypal];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              currentIndex = index;

              setState(() {});
              log(currentIndex.toString());
            },
            child: CustomContainerInListView(
              image: images[index],
              isCurrentIndex: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}