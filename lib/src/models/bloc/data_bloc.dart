import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    loadTheme();
  }

  late bool _isClicked = true;
  late final bool _isSaved = false;
  late bool _isDarkTheme = true;
  late final int _currentIndex = 0;
  late final String _baseNickName = 'Danyil Zborovets';
  late final Map<String, bool> _usernames = {
    'user 1': true,
    'user 2': false,
    'user 3': true,
    'user 4': false,
    'user 5': false
  };

  late final List<String> _savedPhotos = [];

  bool get isDarkTheme => _isDarkTheme;
  bool get isSaved => _isSaved;
  bool get isClicked => _isClicked;
  String get baseNickName => _baseNickName;
  Map<String, bool> get usernames => _usernames;
  List<String> get savedPhotos => _savedPhotos;

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is LikeEvent) {
      _isClicked = !_isClicked;
      yield ClickedState(clicked: _isClicked);
    } else if (event is SaveEvent) {
      _savedPhotos.add(event.photoUrl);
      yield SavedState(savedPhotos: _savedPhotos);
    } else if (event is ToggleThemeEvent) {
      _isDarkTheme = !_isDarkTheme;
      yield ThemeChangedState(isDarkTheme: _isDarkTheme);
      saveTheme();
    } else if (event is DeletePhotoEvent) {
    
        _savedPhotos.removeAt(_savedPhotos.indexOf(event.photoUrl));

        yield SavedState(savedPhotos: _savedPhotos);

    }
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    add(ToggleThemeEvent());
  }

  Future<void> saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', _isDarkTheme);
  }
}
