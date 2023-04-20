import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/bloc/data_bloc.dart';
import 'package:flutter_application_1/src/ui/bottom_bar.dart';
import 'package:flutter_application_1/src/ui/pages/pagePhotos/page_photos.dart';
import 'package:flutter_application_1/src/ui/pages/pageProfile/page_profile.dart';
import 'package:flutter_application_1/src/ui/pages/widgetDrawer/pagesDrawer/pageActivity/activity_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/ui/pages/pageHome/page_home.dart';
import 'src/ui/pages/pagePhotos/bloc/photo_bloc.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataBloc(),
        ),
        BlocProvider(
          create: (context) => PhotoBloc(),
        ),
      ],
      child: const FirstScreen(),
    ));

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        final themeModel = BlocProvider.of<DataBloc>(context);
        return MaterialApp(
          title: 'Привіт, світ!',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness:
                themeModel.isDarkTheme ? Brightness.dark : Brightness.light,
            iconTheme: IconThemeData(
              color: themeModel.isDarkTheme
                  ? Colors.white
                  : const Color(0xFF424242),
            ),
            // textTheme: TextTheme(),
          ),
          home: const MyApp(),
          onGenerateRoute: (settings) {
            if (settings.name == '/photos/photo-details') {
              return MaterialPageRoute(
                builder: (context) => AnimatedBarChart(),
              );
            }
            return null;
          },
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int _selectedTab = 0;

  late TabController _tabController;

  final List<Widget> _pages = [
    const PageOne(),
    const PagePhotos(),
    const SingleChildScrollView(child: Text('data3')),
    const SingleChildScrollView(child: Text('data4')),
    const ProfilePage(),
  ];

  final Map<String, Widget> _routes = {
    '/photos': const PagePhotos(),
    '/photos/photo-details': AnimatedBarChart(),
  };

  final scrollControllers = [
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: _pages.length,
      vsync: this,
      initialIndex: _selectedTab,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    for (var controller in scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onBottomBarTap(int index) {
    if (_selectedTab == index) {
      // The same tab was tapped twice
      _scrollToTop(index);
    } else {
      setState(() {
        _selectedTab = index;
        _tabController.animateTo(index);
      });
    }
  }

  void _scrollToTop(int index) {
    final currentController = scrollControllers[index];
    if (currentController.hasClients) {
      currentController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: _pages
              .map((page) => NestedNavigator(
                    page,
                    scrollController: scrollControllers[_pages.indexOf(page)],
                  ))
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomMenu(
        onTabSelected: _onBottomBarTap,
        selectedIndex: _selectedTab,
      ),
    );
  }
}

class NestedNavigator extends StatelessWidget {
  const NestedNavigator(this.child, {Key? key, required this.scrollController})
      : super(key: key);

  final Widget child;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: UniqueKey(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => PrimaryScrollController(
            controller: scrollController,
            child: child,
          ),
        );
      },
    );
  }
}
