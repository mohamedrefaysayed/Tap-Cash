import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'smart_cards_state.dart';

class SmartCardsCubit extends Cubit<SmartCardsState> {
  SmartCardsCubit() : super(SmartCardsInitial());
}
