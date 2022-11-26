import 'package:blocformvalidation/Screens/Welcome%20Screen/Welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 0,backgroundColor: Colors.blueGrey),
        body: SafeArea(
          child: WelcomeScreen(),
        ),
      ),
    );
  }
}
