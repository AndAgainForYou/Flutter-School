import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/bloc/data_bloc.dart';
import 'package:flutter_application_1/src/ui/pages/widgetDrawer/pagesDrawer/widget_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final themeModel = BlocProvider.of<DataBloc>(context);
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Daniil_Zborovets',
                style: TextStyle(
                    color: themeModel.isDarkTheme
                        ? Colors.white
                        : const Color(0xFF424242)),
              ),
              backgroundColor: themeModel.isDarkTheme
                  ? const Color(0xFF424242)
                  : Colors.white,
              iconTheme: IconThemeData(
                color: themeModel.isDarkTheme
                    ? Colors.white
                    : const Color(0xFF424242),
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
                              padding:
                                  const EdgeInsets.all(16).copyWith(top: 15.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    // padding: EdgeInsets.all(10).copyWith(top: 20),
                                    child: const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://pbs.twimg.com/media/EZ_gFYFX0AIHl1U.jpg'),
                                      radius: 38,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20)),
                                          buildStatColumn('Posts', 3),
                                          buildStatColumn('followers', 511),
                                          buildStatColumn('following', 259),
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
                      SizedBox(
                        width: 365,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.bottomLeft,
                          child: const Text(
                            'Daniil Zborovets',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //bio
                      SizedBox(
                        width: 365,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.bottomLeft,
                          child: const Text('bio goes here'),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
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
                  indicatorColor: !themeModel.isDarkTheme
                      ? const Color(0xFF424242)
                      : Colors.white,
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
                        Icons.account_box_outlined,
                        color: themeModel.isDarkTheme
                            ? Colors.white
                            : const Color(0xFF424242),
                        size: 28,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: TabBarView(children: [
                      //photos on my general profile
                      GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                          mainAxisSpacing: 1.5,
                          crossAxisSpacing: 1.5,
                          children: <Widget>[
                            GestureDetector(
                              child: Image.network(
                                'https://w0.peakpx.com/wallpaper/318/99/HD-wallpaper-the-weeknd-abel.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            GestureDetector(
                              child: Image.network(
                                'https://www.revolt.tv/wp-content/uploads/2021/08/the_weeknd_blinding_lights_vid_2020_billboard_1548.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            GestureDetector(
                              child: Image.network(
                                'https://headlinermagazine.net/assets/image-cache/img/TheWeeknd%20blinding%20lights.7e6c2190.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ]),

                      // photos with my account
                      GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                          mainAxisSpacing: 2.0,
                          crossAxisSpacing: 2.0,
                          children: <Widget>[
                            GestureDetector(
                              child: Image.network(
                                'https://w0.peakpx.com/wallpaper/318/99/HD-wallpaper-the-weeknd-abel.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ])
                    ]),
                  ),
                ),
              ]),
            ));
      },
    );
  }
}
