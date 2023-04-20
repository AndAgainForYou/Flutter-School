import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial());

  static const String _baseUrl = 'https://api.unsplash.com';
  static const String _accessKey =
      'nhPz-0-HFAg_ZsA-GMQZif23sqTIhjkBaJHwL0SsYqg';

  List<Map<String, dynamic>> _randomPhotos = [];

  List<Map<String, dynamic>> get randomPhotos => _randomPhotos;

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is FetchRandomPhotos) {
      yield* _mapFetchRandomPhotosToState(event.count);
    }
  }

  Stream<PhotoState> _mapFetchRandomPhotosToState(int count) async* {
    yield PhotoLoading();
    try {
      final response = await http.get(
          Uri.parse('$_baseUrl/photos/random?count=$count'),
          headers: {'Authorization': 'Client-ID $_accessKey'});

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Map<String, dynamic>> photos = data
            .map((photo) => {
                  'imageUrl': photo['urls']['regular'],
                  'authorName': photo['user']['name']
                })
            .toList();
        _randomPhotos = photos;
        yield PhotoLoaded(photos: photos);
      } else {
        throw Exception('Failed to get random photos');
      }
    } catch (e) {
      yield PhotoError(error: e.toString());
    }
  }
}
