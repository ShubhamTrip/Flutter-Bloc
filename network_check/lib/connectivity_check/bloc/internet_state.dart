part of 'internet_bloc.dart';

@immutable
abstract class InterState {
  final String message = 'checking';
}

class InterInitial extends InterState {}

class InterCheckLoading extends InterState {}

class ConnectedStates extends InterState {
  final String message;

  ConnectedStates({required this.message});
}

class NotConnectedStates extends InterState {
  final String message;

  NotConnectedStates({required this.message});
}

class IsConnectedState extends InterState {
  final bool isDeviceConnected;
  final bool isNetworkAvailable;

  IsConnectedState(this.isDeviceConnected, this.isNetworkAvailable);
}
