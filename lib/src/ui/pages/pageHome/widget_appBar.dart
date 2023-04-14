import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/data_provider.dart';
import 'package:flutter_application_1/src/ui/pages/pageDirect/page_direct.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget with PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return AppBar(
      iconTheme: IconThemeData(
        color: themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
      ),
      backgroundColor:
          themeModel.isDarkTheme ? const Color(0xFF424242) : Colors.white,
      title: Image.asset(
        'assets/images/Instagram_logo.png',
        fit: BoxFit.cover,
        height: 35,
        color: themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
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