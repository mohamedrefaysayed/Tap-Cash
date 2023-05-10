part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}
class SignUpSuccess extends SignUpState {
  String successmessage;
  SignUpSuccess({required this.successmessage});
}
class SignUpFailure extends SignUpState {
  String errormessage;
  SignUpFailure({required this.errormessage});
}

class SignUpIdFill extends SignUpState {}
class SignUpIdFillLoading extends SignUpState {}
class SignUpIdFillSuccess extends SignUpState {}


class SignUpEmailFill extends SignUpState {}
class SignUpEmailFillLoading extends SignUpState {}
class SignUpEmailFillSuccess extends SignUpState {
  String successmessage;
  SignUpEmailFillSuccess({required this.successmessage});
}


class SignUpCodeFill extends SignUpState {}
class SignUpCodeFillLoading extends SignUpState {}
class SignUpCodeResend extends SignUpState {
  String successmessage;
  SignUpCodeResend({required this.successmessage});
}
class SignUpCodeFillSuccess extends SignUpState {
  String successmessage;
  SignUpCodeFillSuccess({required this.successmessage});
}




class SignUpPassFill extends SignUpState {}
class SignUpPassFillLoading extends SignUpState {}
class SignUpPassFillSuccess extends SignUpState {
  String successmessage;
  SignUpPassFillSuccess({required this.successmessage});
}





