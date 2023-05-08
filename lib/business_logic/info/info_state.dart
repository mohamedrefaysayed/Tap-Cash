part of 'info_cubit.dart';

@immutable
abstract class InfoState {}

class InfoInitial extends InfoState {}
class InfoLoading extends InfoState {}
class InfoSuccess extends InfoState {}
class InfoFailure extends InfoState {
  String errormessage;
  InfoFailure({required this.errormessage});

}
class SupportedState extends InfoState {}


