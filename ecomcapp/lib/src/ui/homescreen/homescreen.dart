import 'package:ecomcapp/src/widgets.dart/appBar.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(title: "Shop App", onPress: () {}),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
          ),
        ),
      ),
    );
  }
}
