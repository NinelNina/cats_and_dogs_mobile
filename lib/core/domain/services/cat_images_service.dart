import 'package:dio/dio.dart';
import '../models/image_model.dart';
import '../../api/api_key.dart';

class ImagesService {
  static Future<List<ImageModel>> getCatImages(String order, int limit,
      int? page) async {
    final response = await Dio().get(
        'https://api.thecatapi.com/v1/images/search',
        queryParameters: {
          'api-key': catsKey,
          'order': order,
          'limit': limit,
          'page': page
        }
    );
    return (response.data as List)
        .map((data) =>
        ImageModel(
          null,
          id: data['id'],
          url: data['url'],
          width: data['width'],
          height: data['height'],
        ))
        .toList();
  }


  static Future<List<ImageModel>> getDogImages(String order, int limit,
      int? page) async {
    final response = await Dio().get(
        'https://api.thedogapi.com/v1/images/search',
        queryParameters: {
          'api-key': dogsKey,
          'order': order,
          'limit': limit,
          'page': page
        }
    );
    return (response.data as List)
        .map((data) =>
        ImageModel(
          null,
          id: data['id'],
          url: data['url'],
          width: data['width'],
          height: data['height'],
        ))
        .toList();
  }

  static Future<ImageModel> getRandomCatImage() async {
    final response = await Dio().get(
        'https://api.thecatapi.com/v1/images/search',
        queryParameters: {
          'api-key': catsKey,
          'order': 'RND',
          'limit': 1
        }
    );
    final data = response.data[0];
    return ImageModel(null, id: data['id'], url: data['url'], width: data['width'], height: data['height']);
  }

  static Future<ImageModel> getRandomDogImage() async {
    final response = await Dio().get(
        'https://api.thedogapi.com/v1/images/search',
        queryParameters: {
          'api-key': dogsKey,
          'order': 'RND',
          'limit': 1
        }
    );
    final data = response.data[0];
    return ImageModel(null, id: data['id'], url: data['url'], width: data['width'], height: data['height']);
  }
}