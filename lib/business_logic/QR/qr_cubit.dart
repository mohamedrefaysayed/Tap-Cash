import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {

  // static BarcodeCapture? capture;

  QrCubit() : super(QrInitial());


  reset(){
    emit(QrInitial());
  }

}
