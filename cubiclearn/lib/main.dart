import 'package:cubiclearn/Cubit/cubit.dart';
import 'package:cubiclearn/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final cubit = CounterCubit(10);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cubit.close();
    print("Cubit closed");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit, // CounterCubit(10)
      child: MaterialApp(
          home: Home()
      ),
    );
  }
}