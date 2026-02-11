import 'package:flutter/material.dart';
import 'package:lection_9/app_data.dart';

class AppDataprovider extends InheritedWidget {
  final AppData appData;

  const AppDataprovider({
    required this.appData,
    required super.child,
    super.key,
  });

  static AppDataprovider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataprovider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
