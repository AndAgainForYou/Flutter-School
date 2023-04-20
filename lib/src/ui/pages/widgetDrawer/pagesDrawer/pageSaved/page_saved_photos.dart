import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/bloc/data_bloc.dart';
import 'package:flutter_application_1/src/ui/pages/pagePhotos/photo_hero.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedPhotos extends StatelessWidget {
  const SavedPhotos({Key? key});

  @override
  Widget build(BuildContext context) {
    final themeModel = BlocProvider.of<DataBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'favorites',
          style: TextStyle(
            color:
                themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
          ),
        ),
        backgroundColor:
            themeModel.isDarkTheme ? const Color(0xFF424242) : Colors.white,
        iconTheme: IconThemeData(
          color:
              themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
        ),
      ),
      body: BlocListener<DataBloc, DataState>(
        listener: (context, state) {},
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 3.0,
          children: themeModel.savedPhotos
              .map((photoUrl) => GestureDetector(
                    child: Hero(
                      tag: photoUrl,
                      child: Image.network(
                        photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotosHero(
                                    name: photoUrl,
                                    tag: photoUrl,
                                  )))
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
