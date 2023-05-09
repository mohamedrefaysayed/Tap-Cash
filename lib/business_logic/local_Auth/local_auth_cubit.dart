import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tap_cash/helper/widgets/snackBar/my_SnackBar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {

  static final LocalAuthentication auth = LocalAuthentication();
  static bool authenticated = false;

  LocalAuthCubit() : super(LocalAuthInitial());



  static Future<void> authenticate(context) async {
    authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'You must be verified to continue',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      showTopSnackBar(Overlay.of(context),const mySnackBar.error(message: "You Must Be Verified To Continue"));
      print(e);
    }
  }

}
