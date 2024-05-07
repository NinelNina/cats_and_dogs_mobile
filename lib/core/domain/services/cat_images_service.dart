import 'package:dio/dio.dart';
import '../models/image_model.dart';
import '../../api/api_key.dart';

class CatsService {
  static Future<ImageModel> getImage(String order, int limit) async {
    final response = await Dio().get(
      'https://api.thecatapi.com/v1/images/search',//?order=RND&limit=10&page=0',
      queryParameters:  {'api-key': catsKey, 'order': order}
    );
    final data = response.data[0];
    print(data);
    ImageModel imageModel = ImageModel(null, id: data['id'], url: data['url'], width: data['width'], height: data['height']);
    print(imageModel);
    return imageModel;
  }
}