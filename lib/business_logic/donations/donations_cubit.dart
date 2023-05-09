import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'donations_state.dart';

class DonationsCubit extends Cubit<DonationsState> {
  DonationsCubit() : super(DonationsInitial());
}
