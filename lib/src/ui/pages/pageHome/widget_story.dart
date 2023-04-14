import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/src/ui/pages/pageHome/page_home.dart';
import 'package:provider/provider.dart';

import '../../../models/data_provider.dart';
import '../widget_hero.dart';

class StoryWidget extends StatelessWidget {
  final String name;
  final bool story;

  const StoryWidget({super.key, required this.name, required this.story});

  String get isName => name;
  bool get isStory => story;

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 17.0, left: 16.0),
      child: GestureDetector(
        onTap: () => {
          isStory ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHero(name: isName))) : ''
        },
        child: Column(
          children: <Widget>[
            isStory
                ? CircleAvatar(
                    radius: 39,
                    backgroundImage:
                        const AssetImage('assets/images/story_background.jpg'),
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: themeModel.isDarkTheme ? Color(0xFF424242) : Colors.white,
                      child: Hero(
                        tag: isName,
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage('assets/images/base_profile.png'),
                        ),
                      ),
                    ),
                  )
                : const CircleAvatar(
                    radius: 37,
                    backgroundImage:
                        AssetImage('assets/images/base_profile.png'),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: SizedBox(
                child: Center(
                  child: Text(isName),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
