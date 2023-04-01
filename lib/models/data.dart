import 'package:flutter/material.dart';

class Data with ChangeNotifier {
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
}
