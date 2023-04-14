import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/data_provider.dart';
import 'package:flutter_application_1/src/ui/pages/widgetDrawer/pagesDrawer/pageFavorites/page_favorites.dart';
import 'package:provider/provider.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<Data>(context);
    return Drawer(
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
                onTap: () {
                  Navigator.pushNamed(context, '/BestFriends');  // navigator by named navigation
                },
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const FavoritesPage(title: 'favorites'),
                      )).then((result) {
                    print(result);                                    // print message when widget is closed  1-3-4 task
                  });
                  
                },
              ),
            ],
          ),
        );
  }
}