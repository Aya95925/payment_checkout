import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_checkout/feature/checkout/data/repo/check_out_repo.dart';
import 'package:payment_checkout/feature/checkout/presentation/maneger/payment_cubit/payment_state.dart';
import 'package:payment_checkout/feature/network/model/payment_intent_input_model.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo _checkOutRepo;
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());

    var result = await _checkOutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold(
      ((failure) {
        emit(PaymentFailure(failure.errMessage));
      }),
      (success) {
        emit(PaymentSuccess());
      },
    );
  }
}
