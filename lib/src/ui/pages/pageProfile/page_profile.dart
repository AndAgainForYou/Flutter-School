import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/data_provider.dart';
import 'package:flutter_application_1/src/ui/pages/widgetDrawer/pagesDrawer/pageFavorites/page_favorites.dart';
import 'package:flutter_application_1/src/ui/pages/widgetDrawer/pagesDrawer/widget_drawer.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Column buildStatColumn(String title, int count) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15).copyWith(bottom: 0),
          child: Column(
            children: [
              Text(
                count.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Daniil_Zborovets',
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
        endDrawer: const WidgetDrawer(),
        body: DefaultTabController(
          length: 2,
          child: Column(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16).copyWith(top: 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                // padding: EdgeInsets.all(10).copyWith(top: 20),
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/base_profile.png'),
                                  radius: 38,
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(left: 20)),
                                      buildStatColumn('Posts', 0),
                                      buildStatColumn('followers', 0),
                                      buildStatColumn('following', 0),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //full name
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'fullName',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  //bio
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.bottomLeft,
                    child: const Text('bio goes here'),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18.0),
                                  textStyle: const TextStyle(fontSize: 13)),
                              onPressed: () {},
                              child: const Text('Edit Profile'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.grid_on_sharp,
                    color: themeModel.isDarkTheme
                        ? Colors.white
                        : const Color(0xFF424242),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.abc_sharp,
                    color: themeModel.isDarkTheme
                        ? Colors.white
                        : const Color(0xFF424242),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(children: [
                Text('SOMETHING'),
                Text('SOMETHING 2'),
              ]),
            ),
          ]),
        ));
  }
}
