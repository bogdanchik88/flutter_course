import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'column.dart';
import 'container.dart';
import 'listview.dart';
import 'row.dart';
import 'stack.dart';
import 'wrap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Работа с UI',
      home: Center(child: WrapDemo()),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: ((context, constraints) {
            return Row(
              children: [
                if (constraints.maxWidth > 800) ...[
                  Container(width: 200, height: 200, color: Colors.amber),
                  Container(width: 200, height: 200, color: Colors.blueAccent),
                ] else
                  Container(width: 300, height: 300, color: Colors.amber),
              ],
            );
          }),
        ),
      ),
    );
  }
}
