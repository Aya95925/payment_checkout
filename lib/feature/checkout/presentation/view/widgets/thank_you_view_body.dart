import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_checkout/core/utils/app_assets.dart';
import 'package:payment_checkout/core/utils/app_color.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/success_icon.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/thank_you_card.dart';
import 'package:payment_checkout/feature/checkout/presentation/view/widgets/ticket_cut_circle.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final dividerPosition = MediaQuery.of(context).size.height * .23;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 52,
          left: 20,
          right: 20,
          bottom: 52,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(AppAssets.arrow),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const ThankYouCard(),

                  const SuccessIcon(),

                  Positioned(
                    left: -20,
                    bottom: dividerPosition,
                    child: const TicketCutCircle(),
                  ),

                  Positioned(
                    right: -20,
                    bottom: dividerPosition,
                    child: const TicketCutCircle(),
                  ),

                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: dividerPosition + 20,
                    child: DottedLine(
                      dashLength: 10,
                      dashGapLength: 5,
                      lineThickness: 2,
                      dashColor: AppColor.darkgrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
