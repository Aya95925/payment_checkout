import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_checkout/core/di/di.dart';
import 'package:payment_checkout/core/utils/api_keys.dart';
import 'package:payment_checkout/core/utils/app_routes.dart';
import 'package:payment_checkout/core/widgets/custom_appbar.dart';
import 'package:payment_checkout/feature/checkout/presentation/maneger/payment_cubit/payment_cubit.dart';
import 'package:payment_checkout/feature/checkout/presentation/maneger/payment_cubit/payment_state.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/custom_button.dart';

import 'package:payment_checkout/feature/checkout/presentation/view/widgets/payment_details_list_view.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  late final PaymentCubit cubit;

  @override
  void initState() {
    cubit = getIt<PaymentCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,

      child: SafeArea(
        child: BlocListener<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              Navigator.pushReplacement(context, AppRoute.thankYouView);
            }

            if (state is PaymentFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },

          child: Scaffold(
            appBar: customAppBar(
              title: "Payment Details",

              onTap: () {
                Navigator.pushReplacement(context, AppRoute.myCard);
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

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),

            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20),

              child: BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  return CustomButtom(
                    title: 'Pay',

                    isLoading: state is PaymentLoading,

                    onTap: () {
                      // cubit.makePayment(
                      //   paymentIntentInputModel: PaymentIntentInputModel(
                      //     amount: '100',
                      //     currency: 'usd', customerId: 'cus_UcfifWILJ5jm9E',
                      //   ),
                      // );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => PaypalCheckoutView(
                            sandboxMode: true,
                            clientId:ApiKeys.paypalclientId,
                            secretKey: ApiKeys.paypalSecretKey,
                            transactions: const [
                              {
                                "amount": {
                                  "total": '100',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '100',
                                    "shipping": '0',
                                    "shipping_discount": 0,
                                  },
                                },
                                "description":
                                    "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "Apple",
                                      "quantity": 4,
                                      "price": '10',
                                      "currency": "USD",
                                    },
                                    {
                                      "name": "Pineapple",
                                      "quantity": 5,
                                      "price": '12',
                                      "currency": "USD",
                                    },
                                  ],
                               
                                },
                              },
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              log("onSuccess: $params");
                              Navigator.pop(context);
                            },
                            onError: (error) {
                              log("onError: $error");
                              Navigator.pop(context);
                            },
                            onCancel: () {
                              log('cancelled:');
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
