import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pages/pageHome/widget-post.dart';
import 'package:flutter_application_1/ui/pages/pageHome/widget-story.dart';
import 'package:provider/provider.dart';

import '../../../models/data.dart';
import '../widget-hero.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Add stories
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 16.0),
                    child: Column(children: <Widget>[
                      Stack(
                        children: const <Widget>[
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage('assets/images/base_profile.png'),
                          ),
                          Positioned(
                            right: -2,
                            bottom: -2,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                    AssetImage('assets/images/addstory.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text('My stories'),
                      )
                    ]),
                  ),
                  ...Provider.of<Data>(context)
                      .usernames
                      .entries
                      .map((MapEntry<String, bool> entry) => Column(
                            children: [
                              StoryWidget(
                                name: entry.key,
                                story: entry.value,
                              )
                            ],
                          ))
                      .toList(),
                ],
              ),
            ),
            const HomePost(),
          ],
        ),
      ),
    );
  }
}

