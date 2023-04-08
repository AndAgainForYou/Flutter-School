import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data with ChangeNotifier {
  //change motifier
  bool _isClicked = true;
  bool _isSaved = false;

  int _currentIndex = 0;

  String _baseNickName = 'Danyil Zborovets';

  Map<String, bool> _usernames = {
    'user 1': true,
    'user 2': false,
    'user 3': true,
    'user 4': false,
    'user 5': false
  };

  bool get clicked => _isClicked;
  bool get saved => _isSaved;
  String get nickName => _baseNickName;
  int get index => _currentIndex;
  Map<String, bool> get usernames => _usernames;

  void setLike() {
    _isClicked = !_isClicked;

    notifyListeners();
  }

  void setSave() {
    _isSaved = !_isSaved;

    notifyListeners();
  }

  late bool _isDarkTheme = true;

  ThemeModel() {
    loadTheme();
  }

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    saveTheme();
    notifyListeners();
  }

  Future<void> loadTheme() async {
    //async await with sharedPreferences and Future class
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  Future<void> saveTheme() {
    //sharedPreferences and Future class using .then()
    return SharedPreferences.getInstance().then((prefs) {
      return prefs.setBool('isDarkTheme', _isDarkTheme);
    });
  }

  static const String _baseUrl = 'https://api.unsplash.com';
  static const String _accessKey = 'nhPz-0-HFAg_ZsA-GMQZif23sqTIhjkBaJHwL0SsYqg';

  List<Map<String, dynamic>> _randomPhotos = [];

  List<Map<String, dynamic>> get randomPhotos => _randomPhotos;

  Future<void> fetchRandomPhotos({int count = 1}) async { //parseJson function
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
