part of 'data_bloc.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class ClickedState extends DataState {
  final bool clicked;
  ClickedState({required this.clicked});
}

class SavedState extends DataState {
  final List<String> savedPhotos;
  SavedState({required this.savedPhotos});
}

class ThemeChangedState extends DataState {
  final bool isDarkTheme;
  ThemeChangedState({required this.isDarkTheme});
}
