import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetnotification/Bloc/Internet_bloc.dart';
import 'package:internetnotification/Bloc/Internet_state.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Internet Not Connected'),
          content: const Text(
              'Please Connect to the internet to enjoy uninterrupted fun!'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        home: Scaffold(
            body: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
            if (state is InternetDisconnectedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Disconnected"),
                backgroundColor: Colors.red,
              ));
              _dialogBuilder(context);
            } else if (state is InternetConnectedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
}
