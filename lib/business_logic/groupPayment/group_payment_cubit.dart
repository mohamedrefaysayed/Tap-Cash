import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'group_payment_state.dart';

class GroupPaymentCubit extends Cubit<GroupPaymentState> {

  static double amount = 1000;
  static int counter = 2;
  GroupPaymentCubit() : super(GroupPaymentInitial());
}
