import 'package:flutter/material.dart';
import 'package:lection_6/second_page.dart';

class App1 extends StatelessWidget {
  const App1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final String? result = await Navigator.of(context)
                          .push<String>(
                            MaterialPageRoute(
                              builder: (context) =>
                                  SecondPage(title: "New title"),
                            ),
                          );

                      print(result);
                    },
                    child: const Text("Open 1 page"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
