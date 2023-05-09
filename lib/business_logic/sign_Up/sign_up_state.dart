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

class SignUpPhoneFill extends SignUpState {}
class SignUpPhoneFilloading extends SignUpState {}

class SignUpCodeFill extends SignUpState {}
class SignUpCodeFillLoading extends SignUpState {}

class SignUpPassFill extends SignUpState {}
class SignUpPassFillLoading extends SignUpState {}




