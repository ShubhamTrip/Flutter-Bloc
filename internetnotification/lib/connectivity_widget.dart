// ignore_for_file: non_constant_identifier_names

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetnotification/Cubit/internet_cubit.dart';
import 'package:internetnotification/bloc/bloc.dart';
import 'package:internetnotification/bloc/network_bloc.dart';

import 'Cubit/internet_tale.dart';

ConnectivityWidget() {
  Connectivity connectivity = Connectivity();
  return BlocProvider(
    create: (context) => NetworkBloc(),
    child: MaterialApp(
      home: Scaffold(
          body: Center(
        child:
            BlocConsumer<NetworkBloc, NetworkState>(listener: (context, state) {
          if (state is ConnectionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Disconnected"),
              backgroundColor: Colors.red,
            ));
          } else if (state is ConnectionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Connected"),
              backgroundColor: Colors.green,
            ));
          }
        }, builder: (context, state) {
          if (state is ConnectionSuccess) {
            return const Text("Connected");
          } else if (state is ConnectionFailure) {
            return const Text("Disconnected");
          } else {
            return const Text("Loading..");
          }
        }),
      )),
    ),
  );
}
