part of 'wallet_cubit.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}
class WalletEmpty extends WalletState {}
class WalletShowCards extends WalletState {}


