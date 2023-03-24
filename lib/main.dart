import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/page_direct.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Pages/page_home.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Привіт, світ!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  int _selectedTab = 0;
  bool _isClicked = false;
  bool _isSaved = false;
  late TabController controller;

  void setLike() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  void setSave() {
    setState(() {
      _isSaved = !_isSaved;
    });
  }

  List<Widget> get _widgetPages => [
        PageOne(isClicked: _isClicked, isSaved: _isSaved, setLike: setLike, setSave: setSave),
        SingleChildScrollView(child: Text('data2')),
        SingleChildScrollView(child: Text('data3')),
        SingleChildScrollView(child: Text('data4')),
        SingleChildScrollView(child: Text('data5')),
      ];

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
      backgroundColor: Colors.black,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/home.png'),
                size: 27,
              ),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/search.png'),
                size: 27,
              ),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/post.png'),
                size: 27,
              ),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/reels.png'),
                size: 27,
              ),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/account.png'),
                size: 27,
              ),
              label: 'Home',
              backgroundColor: Colors.black),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab, //New
        onTap: (int index) => {
          setState(() {
            _selectedTab = index;
            controller.animateTo(index);
          })
        },
      ),
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
    return AppBar(
      backgroundColor: Colors.black,
      title: Image.asset(
        'assets/images/Instagram_logo.png',
        fit: BoxFit.cover,
        height: 35,
        color: Colors.white,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => {print("Click on upload button")},
          icon: const ImageIcon(
            AssetImage('assets/images/heart.png'),
            size: 27,
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
            ),
          ),
        ),
      ],
    );
  }
}
