// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/Internet_bloc.dart';
import 'Bloc/Internet_state.dart';

ConnectivityWidget() {
  return BlocProvider(
    create: (context) => InternetBloc(),
    child: MaterialApp(
      home: Scaffold(
          body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
          if (state is InternetDisconnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Disconnected"),
              backgroundColor: Colors.red,
            ));
          } else if (state is InternetConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Connected"),
              backgroundColor: Colors.green,
            ));
          }
        }, builder: (context, state) {
          if (state is InternetConnectedState) {
            return const Text("Connected");
          } else if (state is InternetDisconnectedState) {
            return const Text("Disconnected");
          } else {
            return const Text("Loading..");
          }
        }),
      )),
    ),
  );
}
