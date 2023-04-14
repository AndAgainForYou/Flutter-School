import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/data_provider.dart';
import 'package:flutter_application_1/src/net/photo_repository.dart';
import 'package:flutter_application_1/src/ui/bottom_bar.dart';
import 'package:flutter_application_1/src/ui/pages/pageProfile/page_profile.dart';
import 'package:flutter_application_1/src/ui/pages/widgetDrawer/pagesDrawer/pageBestFriends/page_best_friends.dart';
import 'package:flutter_application_1/src/ui/pages/pagePhotos/page_photos.dart';
import 'package:provider/provider.dart';

import 'src/ui/pages/pageHome/page_home.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        //provider
        providers: [
          ChangeNotifierProvider(create: (_) => Data()),
          ChangeNotifierProvider(create: (_) => PhotoData()),
        ],
        child: Consumer<Data>(
          builder: (context, model, _) => MaterialApp(
            title: 'Привіт, світ!',
            debugShowCheckedModeBanner: false,
            routes: {
              '/BestFriends': (context) => BestFriends(),
            },
            theme: ThemeData(
              brightness:
                  model.isDarkTheme ? Brightness.dark : Brightness.light,
              iconTheme: IconThemeData(
                color:
                    model.isDarkTheme ? Colors.white : const Color(0xFF424242),
              ),
              // textTheme: TextTheme(),
            ),
            home: const MyApp(),
          ),
        ));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  int _selectedTab = 0;

  late TabController controller;

  List<Widget> get _widgetPages => [
        const PageOne(),
        const PagePhotos(),
        const SingleChildScrollView(child: Text('data3')),
        const SingleChildScrollView(child: Text('data4')),
        const ProfilePage(),
      ];

  void bottomBarOnTab(index) {
    setState(() {
      _selectedTab = index;
      controller.animateTo(index);
    });
  }

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: _widgetPages.length,
      vsync: this,
    );

    controller.addListener(() {
      setState(() {
        _selectedTab = controller.index;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const HomeHeader(),
      body: TabBarView(
        controller: controller,
        children: _widgetPages,
      ),
      bottomNavigationBar:
          BottomMenu(bottomBarOnTab: bottomBarOnTab, selectedTab: _selectedTab),
    );
  }
}
