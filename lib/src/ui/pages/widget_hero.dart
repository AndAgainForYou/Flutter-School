import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/bloc/data_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHero extends StatelessWidget {
  final String name;

  const MyHero({super.key, required this.name});

  String get isName => name;

  @override
  Widget build(BuildContext context) {
    final themeModel = BlocProvider.of<DataBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Screen',
          style: TextStyle(
              color: themeModel.isDarkTheme
                  ? Colors.white
                  : const Color(0xFF424242)),
        ),
        backgroundColor:
            themeModel.isDarkTheme ? const Color(0xFF424242) : Colors.white,
        iconTheme: IconThemeData(
          color:
              themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
        ),
      ),
      body: Center(
        child: Hero(
            tag: name, child: Image.asset('assets/images/base_profile.png')),
      ),
    );
  }
}
