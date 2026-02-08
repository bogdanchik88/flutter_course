import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String title;
  const SecondPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Page 1 - $title"),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop("Result 123");
              },
              child: const Text("Return"),
            ),
          ],
        ),
      ),
    );
  }
}
