import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/net/photo_repository.dart';
import 'package:flutter_application_1/src/ui/pages/pagePhotos/photo_hero.dart';
import 'package:provider/provider.dart';


class PagePhotos extends StatefulWidget {
  const PagePhotos({Key? key}) : super(key: key);

  @override
  State<PagePhotos> createState() => _PagePhotosState();
}

class _PagePhotosState extends State<PagePhotos> {
  @override
  void initState() {
    super.initState();
    final photoData = Provider.of<PhotoData>(context, listen: false);
    if (photoData.randomPhotos.isEmpty) {
      photoData.fetchRandomPhotos(count: 21);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<PhotoData>(
        builder: (context, provider, child) {
          if (provider.randomPhotos.isEmpty) {
            return const CircularProgressIndicator();
          } else {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
              children: provider.randomPhotos
                  .map((photo) => GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhotosHero(
                                          name: photo['imageUrl'],
                                        )))
                          },
                      child: Hero(
                          tag: photo['imageUrl'],
                          child: Image.network(
                            photo['imageUrl'],
                            fit: BoxFit.cover,
                          ))))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
