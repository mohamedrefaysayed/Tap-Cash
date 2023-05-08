part of 'qr_cubit.dart';

@immutable
abstract class QrState {}

class QrInitial extends QrState {}
class QrScan extends QrState {}
class QrResult extends QrState {}

