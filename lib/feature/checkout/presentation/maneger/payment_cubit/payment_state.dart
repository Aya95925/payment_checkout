import 'package:equatable/equatable.dart';
import 'package:payment_checkout/feature/network/model/payment_intent_input_model.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {

}

final class PaymentFailure extends PaymentState {
  final String errorMessage;

  const PaymentFailure(this.errorMessage);
}
