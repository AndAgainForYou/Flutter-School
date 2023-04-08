import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data_provider.dart';
import 'package:flutter_application_1/ui/bottom_bar.dart';
import 'package:flutter_application_1/ui/pages/pageDirect/page_direct.dart';
import 'package:flutter_application_1/ui/pages/pagePhotos/page_photos.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'ui/pages/pageHome/page_home.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        //provider
        create: (_) => Data(),
        child: Consumer<Data>(
          builder: (context, model, _) => MaterialApp(
            title: 'Привіт, світ!',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness:
                  model.isDarkTheme ? Brightness.dark : Brightness.light,
              iconTheme: IconThemeData(
                color: model.isDarkTheme ? Colors.white : Color(0xFF424242),
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
        PageOne(),
        PagePhotos(),
        SingleChildScrollView(child: Text('data3')),
        SingleChildScrollView(child: Text('data4')),
        SingleChildScrollView(child: Text('data5')),
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
    final themeModel = Provider.of<Data>(context);
    return Scaffold(
      appBar: const AppHeader(),
      body: TabBarView(
        controller: controller,
        children: _widgetPages,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF262626),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text(
                'Theme color',
                style: TextStyle(color: Colors.white),
              ),
              leading: Switch(
                value: themeModel.isDarkTheme,
                onChanged: (_) => themeModel.toggleTheme(),
              ),
            ),
            ListTile(
              hoverColor: const Color(0xFF262626),
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              hoverColor: const Color(0xFF262626),
              leading: const Icon(
                Icons.settings_backup_restore_outlined,
                color: Colors.white,
              ),
              title: const Text(
                "My activity",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              hoverColor: const Color(0xFF262626),
              leading: const Icon(
                Icons.archive_outlined,
                color: Colors.white,
              ),
              title: const Text(
                "Archive",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              hoverColor: const Color(0xFF262626),
              leading: const Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
              title: const Text(
                "QR-code",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              hoverColor: const Color(0xFF262626),
              leading: const Icon(
                Icons.save_alt_outlined,
                color: Colors.white,
              ),
              title: const Text(
                "Saved",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              hoverColor: const Color(0xFF262626),
              leading: const Icon(
                Icons.star,
                color: Colors.white,
              ),
              title: const Text(
                "Best friends",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              hoverColor: const Color(0xFF262626),
              leading: const Icon(
                Icons.star_border_outlined,
                color: Colors.white,
              ),
              title: const Text(
                "Favorites",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomMenu(bottomBarOnTab: bottomBarOnTab, selectedTab: _selectedTab),
    );
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
        color: themeModel.isDarkTheme ? Colors.white : Color(0xFF424242),
      ),
      backgroundColor:
          themeModel.isDarkTheme ? const Color(0xFF424242) : Colors.white,
      title: Image.asset(
        'assets/images/Instagram_logo.png',
        fit: BoxFit.cover,
        height: 35,
        color: themeModel.isDarkTheme ? Colors.white : Color(0xFF424242),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => {print("Click on upload button")},
          icon: const ImageIcon(
            AssetImage('assets/images/heart.png'),
            size: 27,
            // color: themeModel.isDarkTheme ? Colors.white : Color(0xFF424242),
          ),
        ),
        IconButton(
          padding: const EdgeInsets.all(5),
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DirectPage()))
          },
          icon: const Hero(
            tag: 'direct',
            child: ImageIcon(
              AssetImage('assets/images/sent.png'),
              size: 22,
              //   color: themeModel.isDarkTheme ? Colors.white : Color(0xFF424242),
            ),
          ),
        ),
      ],
    );
  }
}
