part of 'data_bloc.dart';

@immutable
abstract class DataEvent {}

class LikeEvent extends DataEvent {}

class SaveEvent extends DataEvent {
  final String photoUrl;
  SaveEvent({required this.photoUrl});

  @override
  List<Object?> get props => [photoUrl];
}

class DeletePhotoEvent extends DataEvent {
  final String photoUrl;

  DeletePhotoEvent({required this.photoUrl});

  @override
  List<Object> get props => [photoUrl];
}

class ToggleThemeEvent extends DataEvent {}
