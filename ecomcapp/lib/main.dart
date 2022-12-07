import 'package:ecomcapp/src/ui/route_gengerator.dart';
import 'package:ecomcapp/src/utils/constants.dart';
import 'package:ecomcapp/src/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.productsscreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
