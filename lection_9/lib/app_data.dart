import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  Color backgroundColor;

  AppData({required this.backgroundColor});

  void changeBackground(Color newColor) {
    backgroundColor = newColor;
  }
}
