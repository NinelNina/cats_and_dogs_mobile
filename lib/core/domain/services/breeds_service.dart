import 'package:purrfect_paws/core/domain/models/breed_short.dart';
import 'package:dio/dio.dart';
import 'package:purrfect_paws/core/domain/models/image_model.dart';
import '../../api/api_key.dart';

class BreedsService {
  static Future<List<BreedShort>> getCatsBreedsDescrList(int limit, int page) async {
    final response = await Dio().get('https://api.thecatapi.com/v1/breeds',
        queryParameters: {'api-key': catsKey, 'limit': limit, 'page': page});

    List<BreedShort> breedList = [];

    for (var data in response.data) {
      String id = data['reference_image_id'];
      ImageModel? image = null;

      if (id.isNotEmpty) {
        final imageResponse = await Dio().get('https://api.thecatapi.com/v1/images/$id',
            queryParameters: {'api-key': catsKey});
        image = ImageModel(data[id], id: id, url: imageResponse.data['url'], width: imageResponse.data['width'], height: imageResponse.data['height']);
      }

      breedList.add(BreedShort(
        id: data['id'],
        name: data['name'],
        image: image
      ));
    }

    return breedList;
  }

  static Future<List<BreedShort>> getDogsBreedsDescrList(
      int limit, int page) async {
    final response = await Dio().get('https://api.thedogapi.com/v1/breeds',
        queryParameters: {'api-key': dogsKey, 'limit': limit, 'page': page});

    List<BreedShort> breedList = [];

    for (var data in response.data) {
      String id = data['reference_image_id'];
      ImageModel? image = null;

      if (id.isNotEmpty) {
        final imageResponse = await Dio().get('https://api.thedogapi.com/v1/images/$id',
            queryParameters: {'api-key': dogsKey});
        image = ImageModel(data[id].toString(), id: id.toString(), url: imageResponse.data['url'], width: imageResponse.data['width'], height: imageResponse.data['height']);
      }

      breedList.add(BreedShort(
          id: data['id'].toString(),
          name: data['name'],
          image: image
      ));
    }

    return breedList;
  }
}
