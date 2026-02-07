import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Так называемая база'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm)),
          ],
        ),
        body: MyStatlessWidget(color: Colors.white),
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
      ),
    ),
  );
}

class MyStatlessWidget extends StatefulWidget {
  const MyStatlessWidget({super.key, required this.color});

  final Color color;

  @override
  State<MyStatlessWidget> createState() => _MyStatlessWidgetState();
}

class _MyStatlessWidgetState extends State<MyStatlessWidget> {
  late Color color;
  double textSize = 50;

  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          color = Colors.blue;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: color,
            child: Center(
              child: Text('Тестовый тест текст', style: TextStyle(fontSize: textSize)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                textSize+=3;
              });
            },
            child: Text('Больше'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                textSize-=2;
              });
            },
            child: Text('Меньше'),
          ),
        ],
      ),
    );
  }
}

