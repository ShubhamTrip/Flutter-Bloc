import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
part 'internet_event.dart';

part 'internet_state.dart';

// class InterBloc extends Bloc<InterEvent, InterState> {
//   static InterBloc get(context) => BlocProvider.of(context);

//   StreamSubscription? _subscription;

//   bool isDeviceConnected = false;
//   InterBloc() : super(InterInitial()) {
//     on<InterEvent>((event, emit) async {
//       if (event is ConnectedEvent) {
//         //AppConstants.mobileData=true;
//         emit(ConnectedStates(message: "Connected"));
//       } else if (event is NotConnectedEvent) {
//         // AppConstants.mobileData=false;
//         emit(NotConnectedStates(message: "Not Connected"));
//       } else if (event is CheckNetworkEvent) {
//         emit(InterCheckLoading());
//         bool isDeviceConnected = await checkDevice();
//         bool isNetworkAvailable = await checkInternet();
//         emit(IsConnectedState(isDeviceConnected, isNetworkAvailable));
//       }
//     });
//     _subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       print(result);
//       if (result == ConnectivityResult.mobile ||
//           result == ConnectivityResult.wifi) {
//         add(ConnectedEvent());
//       } else {
//         add(NotConnectedEvent());
//       }
//     });
//   }

//   Future<bool> checkDevice() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<bool> checkInternet() async {
//     bool result = await InternetConnectionChecker().hasConnection;
//     return result;
//   }

//   @override
//   Future<void> close() {
//     _subscription!.cancel();
//     return super.close();
//   }
// }

class InterBloc extends Bloc<InterEvent, InterState> {
  InterBloc() : super(InterInitial()) {}
}
