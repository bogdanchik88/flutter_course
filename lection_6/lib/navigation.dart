import 'package:flutter/material.dart';

class NamedNavigation extends StatelessWidget {
  const NamedNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) {
          return const Page1();
        },
        "/page2": (context) {
          final arguments =
              (ModalRoute.of(context)?.settings.arguments ??
                      <String, dynamic>{})
                  as Map;

          return Page2(title: arguments["title"]);
        },
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Page 1"),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  "/page2",
                  arguments: {"title": "My tytle"},
                );
              },
              child: const Text("Go to page 2"),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Page 2"),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: const Text("Go to page 1"),
            ),
          ],
        ),
      ),
    );
  }
}
