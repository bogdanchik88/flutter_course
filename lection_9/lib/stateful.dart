import 'package:flutter/material.dart';
import 'package:lection_9/util_func.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key});

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  Color? color;

  @override
  void initState() {
    super.initState();

    color = Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: color,
            child: Column(
              children: [
                Text(color.toString()),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = UtilFunc.rndColor();
                    });
                  },
                  child: Text("Color"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/second");
                  },
                  child: Text("Second"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
