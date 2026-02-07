import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<StatfulColorTiles> tiles;

  @override
  void initState() {
    super.initState();
    tiles = <StatfulColorTiles>[
      StatfulColorTiles(id: 1, key: UniqueKey()),
      StatfulColorTiles(id: 2, key: UniqueKey()),
      StatfulColorTiles(id: 3, key: ValueKey<int>(1)),
      StatfulColorTiles(id: 4, key: ValueKey<int>(2)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: Icon(Icons.switch_access_shortcut),
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.add(tiles.removeAt(0));
    });

    print('===============================');
    for (var item in tiles) {
      print(item.id);
    }
  }
}

class StatfulColorTiles extends StatefulWidget {
  const StatfulColorTiles({super.key, required this.id});
  final int id;
  @override
  State<StatfulColorTiles> createState() => _StatfulColorTilesState();
}

class _StatfulColorTilesState extends State<StatfulColorTiles> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: color);
  }
}
