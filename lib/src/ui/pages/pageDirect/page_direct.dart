import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/data_provider.dart';
import 'package:provider/provider.dart';

class DirectPage extends StatelessWidget {
  const DirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return Consumer<Data>(builder: (context, data, _) {
      //consumer
      return Scaffold(
        //backgroundColor: Colors.black,
        appBar: const AppHeader(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 16.0),
                      child: Column(children: <Widget>[
                        Stack(
                          children: const <Widget>[
                            //  Container(),
                            Hero(
                                tag: 'direct',
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                      'assets/images/base_profile.png'),
                                )),
                            FractionalTranslation(
                              // right: 50,
                              // bottom: 50,
                              translation: Offset(-0.1, -0.5),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Color(0xFF262626),
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundImage: AssetImage(
                                      'assets/images/plus_whitee.png'),
                                  backgroundColor: Color(0xFF262626),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 15.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Messages',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      'Requests',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                                radius: 30,
                                backgroundImage: const AssetImage(
                                    'assets/images/story_background.jpg'),
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundColor: themeModel.isDarkTheme
                                      ? const Color(0xFF424242)
                                      : Colors.white,
                                  child: const CircleAvatar(
                                    radius: 26,
                                    backgroundImage: AssetImage(
                                        'assets/images/base_profile.png'),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data.nickName,
                                ),
                                const Text(
                                  'Some message',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: ImageIcon(
                        AssetImage('assets/images/comment.png'),
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: themeModel.isDarkTheme
                                  ? const Color(0xFF424242)
                                  : Colors.white,
                              child: const CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage(
                                    'assets/images/base_profile.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'N I C K N A M E',
                                ),
                                Text(
                                  'Some message',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: ImageIcon(
                        AssetImage('assets/images/comment.png'),
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AppHeader extends StatefulWidget with PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return AppBar(
      iconTheme: IconThemeData(
        color: themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
      ),
      backgroundColor:
          themeModel.isDarkTheme ? const Color(0xFF424242) : Colors.white,
      title: Text(
        'Daniil_Zborovets',
        style: TextStyle(
          color:
              themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => {print("Click on upload button")},
          icon: const ImageIcon(
            AssetImage('assets/images/camera.png'),
            size: 27,
          ),
        ),
        IconButton(
          onPressed: () => {print("Click on upload button")},
          icon: const ImageIcon(
            AssetImage('assets/images/plus.png'),
            size: 27,
          ),
        ),
      ],
    );
  }
}
