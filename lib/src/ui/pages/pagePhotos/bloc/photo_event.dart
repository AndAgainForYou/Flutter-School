part of 'photo_bloc.dart';

@immutable
abstract class PhotoEvent {}

class FetchRandomPhotos extends PhotoEvent {
  final int count;

  FetchRandomPhotos({this.count = 1});
}