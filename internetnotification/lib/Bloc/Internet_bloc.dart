import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetnotification/Bloc/Internet_event.dart';
import 'package:internetnotification/Bloc/Internet_state.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  Connectivity connectivity = Connectivity();

  InternetBloc() : super(InternetInitialState()){
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));
    on<InternetDisconnectedEvent>((event, emit) => emit(InternetDisconnectedState()));

    connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.mobile || event==ConnectivityResult.wifi ){
           add(InternetConnectedEvent());
      }
      else{
        add(InternetDisconnectedEvent());
      }
    });
  }
}