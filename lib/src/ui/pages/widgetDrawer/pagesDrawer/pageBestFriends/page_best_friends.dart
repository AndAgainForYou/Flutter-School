import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/bloc/data_bloc.dart';
import 'package:flutter_application_1/src/models/data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BestFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeModel = BlocProvider.of<DataBloc>(context);
    return Scaffold(
          appBar: AppBar(
            title: Text(
              'Best Friends',
              style: TextStyle(
                  color: themeModel.isDarkTheme
                      ? Colors.white
                      : const Color(0xFF424242)),
            ),
            backgroundColor:
                themeModel.isDarkTheme ? const Color(0xFF424242) : Colors.white,
            iconTheme: IconThemeData(
              color: themeModel.isDarkTheme
                  ? Colors.white
                  : const Color(0xFF424242),
            ),
          ),


          body: Column(
            children: [
              Text(themeModel.isClicked.toString()),
                
              
              TextButton(
                  onPressed: () => themeModel.add(LikeEvent()),
                  child: const Text('click')),
            ],
          ),


        );
  }
}
