import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment_checkout/core/di/di.dart';
import 'package:payment_checkout/core/utils/app_routes.dart';
import 'package:payment_checkout/core/widgets/custom_appbar.dart';

import 'package:payment_checkout/feature/checkout/presentation/maneger/payment_cubit/payment_cubit.dart';
import 'package:payment_checkout/feature/checkout/presentation/maneger/payment_cubit/payment_state.dart';

import 'package:payment_checkout/feature/checkout/presentation/view/widgets/custom_button.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/payment_details_list_view.dart';

import 'package:payment_checkout/feature/network/model/payment_intent_input_model.dart';

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
                      cubit.makePayment(
                        paymentIntentInputModel: PaymentIntentInputModel(
                          amount: '100',

                          currency: 'usd',
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
