import 'package:flutter/material.dart';
import 'package:lection_9/app_data.dart';
import 'package:lection_9/provider_page.dart';
import 'package:lection_9/util_func.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppData(backgroundColor: UtilFunc.rndColor()),
      child: MaterialApp(
        routes: {
          '/': (context) => ProviderPage(),
          '/second': (context) => ProviderPage(),
        },
      ),
    ),
  );
}
