import 'package:flutter/material.dart';
import 'package:lection_14/core/di/conffigure_dependencies.dart';
import 'package:lection_14/feature/color/presentation/page/cubit_page.dart';

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
