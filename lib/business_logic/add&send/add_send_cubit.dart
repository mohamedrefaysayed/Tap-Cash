import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_send_state.dart';

class AddSendCubit extends Cubit<AddSendState> {

  static double requestAmount = 1000;
  static double sendAmount = 1000;


  AddSendCubit() : super(AddSendInitial());
}
