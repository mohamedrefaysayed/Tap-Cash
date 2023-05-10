import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {

  static String? QrCodeData;

  QrCubit() : super(QrInitial());


  reset(){
    emit(QrInitial());
  }

}
