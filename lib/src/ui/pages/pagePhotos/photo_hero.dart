import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../../models/data_provider.dart';

class PhotosHero extends StatelessWidget {
  final String name;

  const PhotosHero({super.key, required this.name});

  String get isName => name;

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0, bottom: 5.0),
                    child: CircleAvatar(
                        radius: 22,
                        backgroundColor: themeModel.isDarkTheme
                            ? const Color(0xFF424242)
                            : Colors.white,
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/base_profile.png'),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('nickname_nickmane'),
                      Text(
                        'User location',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 20.0, right: 8.0),
                child: Text(
                  '...',
                  style: TextStyle(fontSize: 30),
                ),
              ),
             
            ],
          ),
          Center(
            child: Hero(tag: name, child: Image.network(name)),
          ),
          Text('data'),
          Text('data'),
          Text('data')
        ],
      )),
    );
  }
}
