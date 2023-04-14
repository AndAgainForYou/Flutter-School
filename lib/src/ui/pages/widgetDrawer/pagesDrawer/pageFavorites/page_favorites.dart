import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/data_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  final String title;

  const FavoritesPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, 'Goodbye!'); //return message when closing tab
          },
          icon: const BackButtonIcon(),
        ),
        title: Text(
          'favorites',
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
      body: Column(
        children: [
          Text(title),
        ],
      ),
    );
  }
}
