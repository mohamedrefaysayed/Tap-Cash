import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selector_state.dart';

class SelectorCubit extends Cubit<SelectorState> {
  static List<bool>? check = List<bool>.filled(4, false) ;
  SelectorCubit() : super(SelectorInitial());

  ChangeRemember(index){
    check![index] = !check![index];
    emit(SelectorInitial());
  }
}
