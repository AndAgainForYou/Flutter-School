import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Person {
  String _name;
  String _lastName;

  Person(this._name, this._lastName);

  String get name => _name;
  String get lastName => _lastName;

  set name(String name) => _name = name;
  set lastName(String lastName) => _lastName = lastName;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Person person = Person('Danyil', 'Zborovets');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Привіт, світ!',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
              'assets/images/Instagram_logo.png', 
              fit: BoxFit.cover, 
              height: 35, 
              color:Colors.white,
            ),
          actions: <Widget>[
            IconButton(
              onPressed: () => {
                print("Click on upload button")
              }, 
              icon: Icon(Icons.favorite_border) 
            ),
            IconButton(
              padding: EdgeInsets.all(5),
              onPressed: () => {
                print("Click on upload button")
              }, 
              icon: Icon(Icons.send_outlined)
            ),
          ],
        ),


        body: SingleChildScrollView(
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
                              backgroundImage: AssetImage('assets/images/base_profile.png'),
                            ),
                            Positioned(
                              right: -2,
                              bottom: -2,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage('assets/images/addstory.png'),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text('User 1'),
                        )
                      ]),
                    ),
                    // Stories 1
                    Padding(
                          padding: const EdgeInsets.only(top: 17.0, left: 16.0),
                          child: Column(
                            children: const <Widget>[
                              CircleAvatar(
                                radius: 39,
                                backgroundImage: AssetImage('assets/images/story_background.jpg'),
                                child: CircleAvatar(
                                  radius: 37,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: AssetImage('assets/images/base_profile.png'),
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
                        // Stories 2
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0, left: 16.0),
                          child: Column(
                            children: const <Widget>[
                                 CircleAvatar(
                                    radius: 37,
                                    backgroundImage: AssetImage('assets/images/base_profile.png'),
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
                                    backgroundImage: AssetImage('assets/images/base_profile.png'),
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
                                    backgroundImage: AssetImage('assets/images/base_profile.png'),
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage('assets/images/story_background.jpg'),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage('assets/images/base_profile.png'),
                                )
                              )
                            ),
                          ),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'User',
                                style: TextStyle(
                                  fontSize: 10
                                ),
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
                          style: TextStyle(
                            fontSize: 30
                          ),
                          ),
                      )
                    ],
                   ),
                   Image.asset('assets/images/story_background.jpg')
                  ],
                ),
               ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Home',
              backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Home',
              backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              label: 'Home',
              backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Home',
              backgroundColor: Colors.black
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
        ),
      ),

    );
  }
}