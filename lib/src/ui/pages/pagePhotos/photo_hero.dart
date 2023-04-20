import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/bloc/data_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosHero extends StatefulWidget {
  final String name;
  final String tag;
 // final bool isImageSaved;

  const PhotosHero({
    Key? key,
    required this.name,
    required this.tag,
    //required this.isImageSaved,
  }) : super(key: key);

  @override
  State<PhotosHero> createState() => _PhotosHeroState();
}

class _PhotosHeroState extends State<PhotosHero> {
  bool isLiked = true;
  bool isSaved = false;

  //get _isImageSaved => isImageSaved;
  @override
  Widget build(BuildContext context) {
    final themeModel = BlocProvider.of<DataBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'review',
          style: TextStyle(
              color: themeModel.isDarkTheme
                  ? Colors.white
                  : const Color(0xFF424242)),
        ),
        backgroundColor:
            themeModel.isDarkTheme ? const Color(0xFF424242) : Colors.white,
        iconTheme: IconThemeData(
          color:
              themeModel.isDarkTheme ? Colors.white : const Color(0xFF424242),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 6.0,
                      right: 6.0,
                    ),
                    child: CircleAvatar(
                        radius: 22,
                        backgroundColor: themeModel.isDarkTheme
                            ? const Color(0xFF424242)
                            : Colors.white,
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/base_profile.png'),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('nickname_nickmane'),
                      Text(
                        'User location',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0, right: 8.0),
                child: Text(
                  '...',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
          Center(
            child: Hero(tag: widget.tag, child: Image.network(widget.name)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: IconButton(
                        icon: isLiked
                            ? Image.asset(
                                'assets/images/heart.png',
                                color: themeModel.isDarkTheme
                                    ? Colors.white
                                    : const Color(0xFF262626),
                              )
                            : Image.asset(
                                'assets/images/heart_red.png',
                              ),
                        onPressed: () {
                          //themeModel.add(LikeEvent());
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        iconSize: 27,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4.0, top: 8.0, right: 4.0),
                      child: ImageIcon(
                        AssetImage('assets/images/comment.png'),
                        // color: Colors.white,
                        size: 27,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 4.0),
                      child: ImageIcon(
                        AssetImage('assets/images/sent.png'),
                        // color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<DataBloc, DataState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                    ),
                    child: IconButton(
                      icon: themeModel.savedPhotos.contains(widget.name)
                          ? Image.asset(
                              'assets/images/bookmark_filed.png',
                              color: themeModel.isDarkTheme
                                  ? Colors.white
                                  : const Color(0xFF262626),
                            )
                          : Image.asset(
                              'assets/images/bookmark.png',
                              color: themeModel.isDarkTheme
                                  ? Colors.white
                                  : const Color(0xFF262626),
                            ),
                      onPressed: () {
                        themeModel.savedPhotos.contains(widget.name)
                            ? themeModel
                                .add(DeletePhotoEvent(photoUrl: widget.name))
                            : themeModel.add(SaveEvent(photoUrl: widget.name));
                      },
                      iconSize: 27,
                    ),
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                isLiked ? '420 likes' : '421 likes',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 10.0),
            child: Container(
              width: window.physicalSize.width,
              alignment: Alignment.centerLeft,
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: 'User' + ' ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: themeModel.isDarkTheme
                          ? Colors.white
                          : const Color(0xFF262626),
                      fontSize: 12,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'hello world how do uuu feel feel feel feel feel there?',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: themeModel.isDarkTheme
                              ? Colors.white
                              : const Color(0xFF262626),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
