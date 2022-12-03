import 'package:flutter/material.dart';
import 'package:weatherapp/src/ui/generate_route.dart';
import 'package:weatherapp/src/util/constants.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeRoute,
      onGenerateRoute: RouteGenerate.generateRoute,
    );
  }
}
