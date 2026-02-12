import 'package:flutter/material.dart';
import 'package:lection_13/user.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final birthday = DateTime.now();

    final user1 = UserModel(
      login: "user",
      firstName: "Bogdan",
      lastName: "Krutoy",
      birthday: birthday,
      photo: "photo",
    );

    final user2 = UserModel(
      login: "user",
      firstName: "loh",
      lastName: "pedalniy",
      birthday: birthday,
      photo: "photo",
    );

    print(user1 == user2);

    return Scaffold(body: Center(child: Text(user2.login)));
  }
}
