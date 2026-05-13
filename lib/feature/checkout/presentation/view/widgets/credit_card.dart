import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  void onCreditCardModelChange(CreditCardModel cardModel) {
    setState(() {
      cardNumber = cardModel.cardNumber;
      expiryDate = cardModel.expiryDate;
      cardHolderName = cardModel.cardHolderName;
      cvvCode = cardModel.cvvCode;
      showBackView = cardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          isHolderNameVisible: true,
          showBackView: showBackView,
          onCreditCardWidgetChange: (CreditCardBrand brand) {},
        ),
        const SizedBox(height: 20),
        CreditCardForm(
          formKey: formKey,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: onCreditCardModelChange,
        ),
      ],
    );
  }
}