import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'online_payment_state.dart';

class OnlinePaymentCubit extends Cubit<OnlinePaymentState> {

  static int counter = 1;
  static double amount = 350;
  static String itemName = "";

  OnlinePaymentCubit() : super(OnlinePaymentInitial());
}
