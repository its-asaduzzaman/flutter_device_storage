import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800,
    // inversePrimary: Colors.redAccent,
  ),
);
