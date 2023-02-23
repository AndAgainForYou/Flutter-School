import 'package:flutter/material.dart';

class Person {
  String _name;
  String _lastName;

  Person(this._name, this._lastName);

  String get name => _name;
  String get lastName => _lastName;

  set name(String name) => _name = name;
  set lastName(String lastName) => _lastName = lastName;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Person person = Person('Danyil', 'Zborovets');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Привіт, світ!',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Завдання 1'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Імя: ${person.name}',
              ),
               Text(
                'Прізвище: ${person.lastName}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}