import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'connectivity_state.dart';

class InternetCubit extends Cubit<InternetState> {
  bool isFirstTime = true;
  late StreamSubscription subscription;
  InternetCubit() : super(InitialState()) {
    subscription = InternetConnectionChecker().onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.disconnected) {
        isFirstTime = false;
        emit(NotConnectedState());
      } else if (event == InternetConnectionStatus.connected) {
        if (isFirstTime) {
          isFirstTime = false;
        } else {
          emit(ConnectedState());
        }
      }
    });
  }
  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
