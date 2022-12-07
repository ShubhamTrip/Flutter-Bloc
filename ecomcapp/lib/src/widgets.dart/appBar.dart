import 'package:flutter/material.dart';

CustomAppBar({required String title, required Function onPress}) {
  return AppBar(
    backgroundColor: Colors.blueGrey[900],
    title: Text("$title"),
    actions: [
      IconButton(onPressed: () => onPress, icon: const Icon(Icons.favorite))
    ],
  );
}
