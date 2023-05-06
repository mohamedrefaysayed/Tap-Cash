import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthCubit() : super(LocalAuthInitial());
}
