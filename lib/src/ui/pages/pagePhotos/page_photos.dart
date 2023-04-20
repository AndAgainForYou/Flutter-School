import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/bloc/data_bloc.dart';
import 'package:flutter_application_1/src/ui/pages/pagePhotos/bloc/photo_bloc.dart';
import 'package:flutter_application_1/src/ui/pages/pagePhotos/photo_hero.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PagePhotos extends StatefulWidget {
  const PagePhotos({Key? key}) : super(key: key);

  @override
  State<PagePhotos> createState() => _PagePhotosState();
}

class _PagePhotosState extends State<PagePhotos> {
  @override
  void initState() {
    super.initState();
    final photoBloc = BlocProvider.of<PhotoBloc>(context);
    if (photoBloc.randomPhotos.isEmpty) {
      photoBloc.add(FetchRandomPhotos(count: 21));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = BlocProvider.of<DataBloc>(context);
    return Center(
      child: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PhotoLoaded) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
              children: state.photos
                  .map((photo) => GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhotosHero(
                                        name: photo['imageUrl'],
                                       
                                        tag: photo['imageUrl'])))
                          },
                      child: Hero(
                          tag: photo['imageUrl'],
                          child: Image.network(
                            photo['imageUrl'],
                            fit: BoxFit.cover,
                          ))))
                  .toList(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
