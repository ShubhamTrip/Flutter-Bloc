import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white, textTheme: textTheme());
}

TextTheme textTheme() {
  return TextTheme(
      headline1: TextStyle(fontSize: 20, color: Colors.black87),
      headline2: TextStyle(
          fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w600),
      headline3: TextStyle(fontSize: 16, color: Colors.black87));
}
