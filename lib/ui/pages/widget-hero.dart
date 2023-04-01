import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {

  final String name;

  const MyHero({super.key, required this.name});

  String get isName => name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Screen'),
      ),
      body: Center(
        child: Hero(
            tag: name,
            child: Image.asset('assets/images/base_profile.png')),
      ),
    );
  }
}