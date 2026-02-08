import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(width: 100, height: 100, color: Colors.blue),
        ),
        Expanded(
          flex: 2,
          child: Container(width: 100, height: 100, color: Colors.yellow),
        ),
        Expanded(
          flex: 1,
          child: Container(width: 100, height: 100, color: Colors.grey),
        ),
      ],
    );
  }
}
