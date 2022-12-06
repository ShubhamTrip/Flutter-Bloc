import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetnotification/Bloc/Internet_event.dart';
import 'package:internetnotification/Bloc/Internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _subscription;
  Connectivity _connectivity = Connectivity();

  InternetBloc() : super(InternetInitialState()) {
    on<InternetDisconnectedEvent>(
        ((event, emit) => emit(InternetDisconnectedState())));
    on<InternetConnectedEvent>(
        ((event, emit) => emit(InternetConnectedState())));

    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetConnectedEvent());
      } else {
        add(InternetDisconnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
