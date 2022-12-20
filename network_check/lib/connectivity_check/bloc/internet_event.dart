part of 'internet_bloc.dart';

@immutable
abstract class InterEvent {}

class ConnectedEvent extends InterEvent {}

class NotConnectedEvent extends InterEvent {}

class CheckNetworkEvent extends InterEvent {}
