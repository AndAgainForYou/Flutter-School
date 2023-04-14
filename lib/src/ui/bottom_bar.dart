import 'package:flutter/material.dart';


class BottomMenu extends StatelessWidget {
  final Function bottomBarOnTab;
  final int selectedTab;

  const BottomMenu({
    super.key,
    required this.bottomBarOnTab, required this.selectedTab,
  });

  int get getSelectedTab => selectedTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: getSelectedTab, //New
      onTap: (int index) => {bottomBarOnTab(index)},
    );
  }
}