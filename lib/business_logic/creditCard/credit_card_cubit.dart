import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'credit_card_state.dart';

class CreditCardCubit extends Cubit<CreditCardState> {
  CreditCardCubit() : super(CreditCardInitial());
}
