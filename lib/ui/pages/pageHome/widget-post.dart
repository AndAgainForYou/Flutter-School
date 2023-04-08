import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/data_provider.dart';
import '../widget-hero.dart';

class HomePost extends StatelessWidget {
  const HomePost({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyHero(name: 'user 1')))
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            radius: 24,
                            backgroundImage: const AssetImage(
                                'assets/images/story_background.jpg'),
                            child: CircleAvatar(
                                radius: 22,
                                backgroundColor: themeModel.isDarkTheme ? const Color(0xFF424242) : Colors.white,
                                child: const Hero(
                                  tag: 'null',
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/base_profile.png'),
                                  ),
                                ))),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'User',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text('data')
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '...',
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
            Image.asset('assets/images/story_background.jpg')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: IconButton(
                      icon: Provider.of<Data>(context).clicked
                          ? Image.asset(
                              'assets/images/heart.png',
                              color: themeModel.isDarkTheme
                                  ? Colors.white
                                  : const Color(0xFF262626),
                            )
                          : Image.asset(
                              'assets/images/heart_red.png',
                            ),
                      onPressed: () {
                        Provider.of<Data>(context, listen: false).setLike();
                      },
                      iconSize: 27,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0, top: 8.0, right: 4.0),
                    child: ImageIcon(
                      AssetImage('assets/images/comment.png'),
                      // color: Colors.white,
                      size: 27,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 4.0),
                    child: ImageIcon(
                      AssetImage('assets/images/sent.png'),
                      // color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: IconButton(
                icon: Provider.of<Data>(context).saved
                    ? Image.asset(
                        'assets/images/bookmark_filed.png',
                        color: themeModel.isDarkTheme
                            ? Colors.white
                            : const Color(0xFF262626),
                      )
                    : Image.asset(
                        'assets/images/bookmark.png',
                        color: themeModel.isDarkTheme
                            ? Colors.white
                            : const Color(0xFF262626),
                      ),
                onPressed: () {
                  Provider.of<Data>(context, listen: false)
                      .setSave(); //provider of
                },
                iconSize: 27,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              Provider.of<Data>(context).clicked ? '420 likes' : '421 likes',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10.0),
          child: Container(
            width: window.physicalSize.width,
            alignment: Alignment.centerLeft,
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text: 'User' + ' ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: themeModel.isDarkTheme
                        ? Colors.white
                        : const Color(0xFF262626),
                    fontSize: 12,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'hello world how do uuu feel feel feel feel feel there?',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: themeModel.isDarkTheme
                            ? Colors.white
                            : const Color(0xFF262626),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
