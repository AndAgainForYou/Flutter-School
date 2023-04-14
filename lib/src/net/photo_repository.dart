import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class PhotoData with ChangeNotifier {
  static const String _baseUrl = 'https://api.unsplash.com';
  static const String _accessKey =
      'nhPz-0-HFAg_ZsA-GMQZif23sqTIhjkBaJHwL0SsYqg';

  List<Map<String, dynamic>> _randomPhotos = [];

  List<Map<String, dynamic>> get randomPhotos => _randomPhotos;

  Future<void> fetchRandomPhotos({int count = 1}) async {
    final response = await http.get(
        Uri.parse('$_baseUrl/photos/random?count=$count'),
        headers: {'Authorization': 'Client-ID $_accessKey'});

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _randomPhotos = data
          .map((photo) => {
                'imageUrl': photo['urls']['regular'],
                'authorName': photo['user']['name']
              })
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to get random photos');
    }
  }
}
