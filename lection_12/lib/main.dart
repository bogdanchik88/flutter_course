import 'package:flutter/material.dart';
import 'package:flutter_eleventh_clean_architicture/core/di/configure_dependencies.dart';
import 'package:flutter_eleventh_clean_architicture/feature/color/presentation/page/cubit_page.dart';

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
