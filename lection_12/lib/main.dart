import 'package:flutter/material.dart';
import 'package:lection_12/core/di/configure_dependencies.dart';
import 'package:lection_12/feature/color/presentation/page/cubit_page.dart';

void main() {
  configureDependencies();
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => CubitPage(),
        "/second": (context) => CubitPage(),
      },
    ),
  );
}
