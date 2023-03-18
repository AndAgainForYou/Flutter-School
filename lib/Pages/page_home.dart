import 'dart:ui';

import 'package:flutter/material.dart';

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

                  // Stories 1
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0, left: 16.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHero()))
                      },
                      child: Column(
                        children: const <Widget>[
                          CircleAvatar(
                            radius: 39,
                            backgroundImage: AssetImage(
                                'assets/images/story_background.jpg'),
                            child: CircleAvatar(
                              radius: 37,
                              backgroundColor: Colors.black,
                              child: Hero(
                                tag: 'addStory',
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                      'assets/images/base_profile.png'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.0),
                            child: SizedBox(
                              child: Center(
                                child: Text('User 2'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Stories 2
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0, left: 16.0),
                    child: Column(
                      children: const <Widget>[
                        CircleAvatar(
                          radius: 37,
                          backgroundImage:
                              AssetImage('assets/images/base_profile.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: SizedBox(
                            child: Center(
                              child: Text('User 3'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Stories 3
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0, left: 16.0),
                    child: Column(
                      children: const <Widget>[
                        CircleAvatar(
                          radius: 37,
                          backgroundImage:
                              AssetImage('assets/images/base_profile.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: SizedBox(
                            child: Center(
                              child: Text('User 4'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Stories 4
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0, left: 16.0),
                    child: Column(
                      children: const <Widget>[
                        CircleAvatar(
                          radius: 37,
                          backgroundImage:
                              AssetImage('assets/images/base_profile.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: SizedBox(
                            child: Center(
                              child: Text('User 5'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                                    builder: (context) => const MyHero()))
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(
                                    'assets/images/story_background.jpg'),
                                child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.black,
                                    child: Hero(
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
                    children: const <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: 8.0, top: 8.0, right: 4.0),
                        child: ImageIcon(
                          AssetImage('assets/images/heart.png'),
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 8.0, top: 8.0, right: 4.0),
                        child: ImageIcon(
                          AssetImage('assets/images/comment.png'),
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 8.0, top: 8.0, right: 4.0),
                        child: ImageIcon(
                          AssetImage('assets/images/sent.png'),
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, right: 8.0),
                  child: ImageIcon(
                          AssetImage('assets/images/bookmark.png'),
                          color: Colors.white,
                          size: 27,
                        ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 10.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  '420 likes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                  text: const TextSpan(
                      text: 'User' + ' ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //  color: Colors.white,
                        fontSize: 12,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'hello world how do uuu feel feel feel feel feel there?',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Column postsBlock() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage('assets/images/story_background.jpg'),
                    child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/base_profile.png'),
                        ))),
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
  );
}

class MyHero extends StatelessWidget {
  const MyHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Screen'),
      ),
      body: Center(
        child: Hero(
            tag: 'addStory',
            child: Image.asset('assets/images/base_profile.png')),
      ),
    );
  }
}
