import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'internet_tale.dart';

class InternetCubit extends Cubit<InternetStates> {
  late StreamSubscription connectivityStreamSubscription;
  final Connectivity connectivity;
  InternetCubit(this.connectivity) : super(InternetStates.InternetLoading) {
    isInternet(InternetConnectionChecker());
  }

  isInternet(InternetConnectionChecker dc) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) async {
      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network, make sure there is actually a net connection.
        bool connected = await checkConnection(dc);
        connected == true
            ? emitInternetConnected()
            : emitInternetDisconnected();
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a WIFI network, make sure there is actually a net connection.
        bool connected = await checkConnection(dc);
        connected == true
            ? emitInternetConnected()
            : emitInternetDisconnected();
      } else {
        // Neither mobile data or WIFI detected, not internet connection found.
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected() => emit(InternetStates.InternetConnected);

  void emitInternetDisconnected() => emit(InternetStates.InternetDisconnected);
  Future<bool> checkConnection(InternetConnectionChecker dc) async {
    if (await dc.hasConnection) {
      // Wifi detected & internet connection confirmed.
      print("Internet");
      return true;
    } else {
      // Wifi detected but no internet connection found.
      print("No Internet");
      return false;
    }
  }
}
