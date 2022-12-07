import 'package:ecomcapp/src/ui/homescreen/homescreen.dart';
import 'package:ecomcapp/src/ui/product_description/product_description.dart';
import 'package:ecomcapp/src/ui/productsscreen/productsscreen.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productdes:
        return MaterialPageRoute(builder: (_) => ProductDescription());
      case Routes.productsscreen:
        return MaterialPageRoute(builder: (_) => ProductsScreen());
      case Routes.homescreen:
        return MaterialPageRoute(builder: (_) => Homescreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('Something went wrong')),
                ));
    }
  }
}
