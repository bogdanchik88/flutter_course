import 'package:flutter/material.dart';
import 'package:lection_10/bloc/color_bloc.dart';
import 'package:lection_10/cubit_page.dart';

final colorBloc = ColorBloc();

void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => CubitPage(),
        "/second": (context) => CubitPage(),
      },
    ),
  );
}
