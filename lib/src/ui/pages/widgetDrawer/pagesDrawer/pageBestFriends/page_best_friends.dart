import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/data_provider.dart';
import 'package:provider/provider.dart';

class BestFriends extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
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
          color:
              themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
        ),
      ),
      body: Text('bestFriends'),
    );
  }
}
