import 'package:flutter/material.dart';
import 'package:network_check/connectivity_check/model/connectivity_model.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return connectivityProvider(MaterialApp(
      home: connectivityListener(
        Scaffold(body: connectivityBuilder(Center(child: Text("HEllo")))),
      ),
    ));
  }
}
