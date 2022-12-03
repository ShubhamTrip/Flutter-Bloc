import 'package:flutter/material.dart';

import '../util/constants.dart';
import 'homecontainer/homecontainer.dart';
import 'splash_screen/splash_screen.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeContainer());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Something went wrong')),
                ));
    }
  }
}
