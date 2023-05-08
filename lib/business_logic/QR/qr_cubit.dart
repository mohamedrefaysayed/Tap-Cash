import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {

  static BarcodeCapture? capture;

  QrCubit() : super(QrInitial());


  reset(){
    emit(QrInitial());
  }

}
