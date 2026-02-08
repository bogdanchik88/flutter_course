import 'package:flutter/material.dart';

class OngenerateRouteNavigation extends StatelessWidget {
  const OngenerateRouteNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLUTTER",
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(builder: (context) => const Page1());
        }

        var uri = Uri.parse(settings.name ?? "");

        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == "details") {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => Page2(title: id));
        }

        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text("UnknownPage")),
          ),
        );
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
            Text("page1"),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, "/details/5");
              },
              child: Text("To 2 page"),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String title;
  const Page2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("page2 with id - $title"),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text("To page 1"),
            ),
          ],
        ),
      ),
    );
  }
}
