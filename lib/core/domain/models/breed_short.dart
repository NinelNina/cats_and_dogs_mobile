import 'package:purrfect_paws/core/domain/models/image_model.dart';

class BreedShort
{
  final String id;
  final String name;
  final ImageModel? image;

  BreedShort({required this.id, required this.name, required this.image});
}