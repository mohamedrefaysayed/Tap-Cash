import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_mony_amount_state.dart';

class AddMonyAmountCubit extends Cubit<AddMonyAmountState> {
  static double amount = 1000;
  static double limitPerTransaction = 20000;
  static double cashWithDrawallimit = 20000;


  AddMonyAmountCubit() : super(AddMonyAmountInitial());
}
