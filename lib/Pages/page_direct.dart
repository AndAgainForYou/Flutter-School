import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DirectPage extends StatelessWidget {
  const DirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('direct'),
      ),
      body: Center(
        child: Hero(
            tag: 'direct',
            child: Image.asset('assets/images/base_profile.png')),
      ),
    );
  }
}