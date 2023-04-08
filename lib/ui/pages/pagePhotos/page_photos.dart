import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/ui/pages/pagePhotos/photo_hero.dart';
import 'package:provider/provider.dart';

import '../../../models/data_provider.dart';

class PagePhotos extends StatelessWidget {
  const PagePhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<Data>(
        builder: (context, provider, child) {
          if (provider.randomPhotos.isEmpty) {
            provider.fetchRandomPhotos(count: 21);
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

/* _photoProvider.randomPhotos.isEmpty
              ? CircularProgressIndicator()
              : Image.network(_photoProvider.randomPhotos.first['imageUrl']),
              
              
              
                  children: provider.randomPhotos.map((photo) {
                    return Center(
                        child: Row(
                      children: [
                        Image.network(
                          photo['imageUrl'],
                          height: 200,
                          width: 200,
                        ),
                      ],
                    ));
                  }).toList(),
              
              
              */ 