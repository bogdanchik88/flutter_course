import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lection_5/future.dart';
import 'package:lection_5/stream.dart';

void main() {
  generatorsExample();
}

const count = 5;
void baseExample() {
  print('count = $count');

  var countVar = 5;
  countVar++;

  print('countVar = ${countVar.runtimeType}');
  print('countVar = $countVar');

  final List<int> list = [];

  list.add(1);
  print(list);
}

class User {
  int? age;
  String? name;

  User({this.age, this.name});
}

void nullSafelyExample() {
  int? countNullable = 5;
  countNullable = null;

  int number2 =
      countNullable ??
      0; // Если переменная null - присваивается значение справа

  //print(countNullable!);

  User? user;
  user?.age =
      5; // Проверка на nullable, если не nullable тогда присваивает значение

  User? user2;

  user2
    ?..age = 25
    ..name = "Tom";

  late final int lateCount; //Отложенная иницилизация late

  //print(countNullable!); //Приведение к non-nullable

  Never valueIsNotDefined() {
    throw ArgumentError("value is not defined");
  }

  int method(int? value) {
    if (value == null) {
      return valueIsNotDefined();
    }
    return value;
  }

  method(null);
}

//ООП
abstract class Person {
  final String name;
  final int age;
  final bool sex;

  //final String _lastName; // Приватное поле

  Person({required this.name, required this.age, required this.sex});
}

class Student extends Person {
  Student({
    required super.name,
    required super.age,
    required super.sex,
    required this.avgScore,
  });
  final int avgScore;
}

class Man implements Person {
  @override
  final int age;
  @override
  final String name;

  Man({required this.age, required this.name});

  @override
  bool get sex => true;
}

//Расширение функционала класса
extension ManExtansion on Man {
  bool get isOld {
    if (age > 65) {
      return true;
    } else {
      return false;
    }
  }
}

void oopExample() {
  Person p = Student(age: 15, name: "Tom", sex: true, avgScore: 4);
  print(p);

  Man man = Man(age: 50, name: "Jame");
  print(man.isOld);
}

void collectionsExample() {
  final list1 = ['Item1', 'Item2', 'Item3', 5, true];
  final list2 = <String>['Item1', 'Item2', 'Item3'];
  final list3 = List<String>.empty(growable: true);
  list3.add("sss");
  print(list1);

  final map = {'key1': 1};

  print(map['key1']);
}

void recordsExample() {
  var item = ("name", 54);
  print(item.$1);

  (String, int, int) item2 = ("Name2", 13, 165);
  print(item2);

  var item3 = (name: "Name3", age: 2);
  print(item3.name);
}

void asincExample() async {
  final result = await Future<String>(() async {
    return "str1";
  });

  print(result);

  //Порядок:
  print("startMain"); // 1
  Future(() => print(1)); //4
  Future.microtask(() => print(2)); //3
  print("end main"); // 2
}

void asincEx() {
  //Порядок
  print("Start main"); // 1
  Future(() => print("future1")).then((value) {
    // 5
    print("then1"); // 6
    Future(() => print("nested future")); // 9
  });

  Future.sync(
    () => print("future sync"), // 2
  ).then((value) => print("then sync")); //4
  Future(() => print("Future 2")) // 7
      .then((value) => print("then 2")); //8

  print("End main"); // 3

  // flutter: Start main
  // flutter: future sync
  // flutter: End main
  // flutter: then sync
  // flutter: future1
  // flutter: then1
  // flutter: Future 2
  // flutter: then 2
  // flutter: nested future
}

void streamExample() async {
  var controller = StreamController<String>();

  final subscription = controller.stream.listen((event) {
    print(event);
  });

  await Future.delayed(const Duration(seconds: 1));
  controller.add("1");
  await Future.delayed(const Duration(seconds: 1));
  controller.add("2");
  await Future.delayed(const Duration(seconds: 1));

  subscription.cancel();
}

//Генераторы
void generatorsExample() async {
  //print(naturalsTo(5).take(3));

  asyncNaturalsTo(5).listen((event) {
    print(event);
  });
}

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) {
    yield k++;
    // yield* naturalsTo(n - 1); // Передача управления другому генератору
  }
}

Stream<int> asyncNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) {
    await Future.delayed(const Duration(seconds: 2));
    yield k++;
  }
}
