part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<Map<String, dynamic>> photos;

  PhotoLoaded({required this.photos});
}

class PhotoError extends PhotoState {
  final String error;

  PhotoError({required this.error});
}