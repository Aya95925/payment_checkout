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
import 'package:payment_checkout/feature/network/model/amount_model/amount_model.dart';
import 'package:payment_checkout/feature/network/model/amount_model/details.dart';
import 'package:payment_checkout/feature/network/model/item_model/item.dart';
import 'package:payment_checkout/feature/network/model/item_model/item_model.dart';

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
                      var amount = AmountModel(
                        currency: "USD",
                        details: Details(
                          shipping: '0',
                          shippingDiscount: 0,
                          subtotal: '100',
                        ),
                        total: '100',
                      );
                      var item = ItemModel(
                        items: [
                          Item(
                            currency: "USD",
                            name: "Apple",
                            price: '10',
                            quantity: 4,
                          ),
                          Item(
                            currency: "USD",
                            name: "Pineapple",
                            price: '12',
                            quantity: 5,
                          ),
                        ],
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => PaypalCheckoutView(
                            sandboxMode: true,
                            clientId: ApiKeys.paypalclientId,
                            secretKey: ApiKeys.paypalSecretKey,
                            transactions: [
                              {
                                "amount": amount.toJson(),
                                "description":
                                    "The payment transaction description.",

                                "item_list": item.toJson(),
                              },
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'The payment process was successful.',
                                  ),
                                ),
                              );
                              // log("onSuccess: $params");
                            },
                            onError: (error) {
                              // log("onError: $error");

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("onError: $error")),
                              );

                              Navigator.pop(context);
                            },
                            onCancel: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'The payment process was canceled.',
                                  ),
                                ),
                              );

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
