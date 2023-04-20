import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final Function(int) onTabSelected;
  final int selectedIndex;

  const BottomMenu({
    Key? key,
    required this.onTabSelected,
    required this.selectedIndex,
  }) : super(key: key);

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
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/search.png'),
            size: 27,
          ),
          label: 'Search',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/post.png'),
            size: 27,
          ),
          label: 'Post',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/reels.png'),
            size: 27,
          ),
          label: 'Reels',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/account.png'),
            size: 27,
          ),
          label: 'Account',
          backgroundColor: Colors.black,
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.red,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onTabSelected,
    );
  }
}