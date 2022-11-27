import 'package:blocweatherapp/search_page/search_page.dart';
import 'package:blocweatherapp/search_page/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_page/Bloc/search_bloc.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          body: BlocProvider(
            create: (context) => SearchBloc(WeatherRepo()),
            child: SearchPage(),
          ),
        )
    );
  }
}
