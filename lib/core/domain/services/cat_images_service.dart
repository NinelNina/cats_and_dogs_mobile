import 'package:dio/dio.dart';
import '../models/image_model.dart';
import '../../api/api_key.dart';

class ImagesService {
  static Future<ImageModel> getCatImage(String order, int limit) async {
    final response = await Dio().get(
      'https://api.thecatapi.com/v1/images/search',//?order=RND&limit=10&page=0',
      queryParameters:  {'api-key': catsKey, 'order': order}
    );
    final data = response.data[0];
    ImageModel imageModel = ImageModel(null, id: data['id'], url: data['url'], width: data['width'], height: data['height']);
    return imageModel;
  }

  static Future<ImageModel> getDogImage(String order, int limit) async {
    final response = await Dio().get(
      'https://api.thedogapi.com/v1/images/search',//?order=RND&limit=10&page=0',
      queryParameters:  {'api-key': dogsKey, 'order': order}
    );
    final data = response.data[0];
    ImageModel imageModel = ImageModel(null, id: data['id'], url: data['url'], width: data['width'], height: data['height']);
    return imageModel;
  }
}