import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../cubit/connectivity_cubit.dart';
import '../cubit/connectivity_state.dart';

connectivityProvider(Widget widget) {
  // late StreamSubscription subscription;
  final InternetConnectionChecker customInstance =
      InternetConnectionChecker.createInstance(
          checkInterval: const Duration(seconds: 1),
          checkTimeout: const Duration(seconds: 2));
  return BlocProvider(
    create: (context) => InternetCubit(customInstance),
    child: widget,
  );
}

connectivityListener(Widget widget) {
  return BlocListener<InternetCubit, InternetState>(
    child: widget,
    listener: (context, state) {
      if (state is ConnectedState) {
        snackBarMessage(
            context: context, message: "Connected", color: Colors.green);
      } else if (state is NotConnectedState) {
        snackBarMessage(
            context: context, message: "No Internet", color: Colors.red);
      }
    },
  );
}

connectivityBuilder(Widget widget) {
  return BlocBuilder<InternetCubit, InternetState>(
    builder: (context, state) {
      if (state is NotConnectedState) {
        return const Scaffold(
          body: Center(
            child: Text("Error"),
          ),
        );
      }
      return widget;
    },
  );
}

snackBarMessage(
    {required BuildContext context,
    required String message,
    required Color color}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        backgroundColor: color,
      ),
    );
}
