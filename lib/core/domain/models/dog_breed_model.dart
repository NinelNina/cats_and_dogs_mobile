import 'package:purrfect_paws/core/domain/models/physical_parameter.dart';

class DogBreed
{
  final String id;
  final String name;
  final String? origin;
  final String? country_code;
  final String? breed_group;
  final String temperament;
  final String life_span;
  final String bred_for;
  final String reference_image_id;
  final PhysicalParameter weight;
  final PhysicalParameter height;

  DogBreed(this.origin, this.country_code, this.breed_group, {required this.id, required this.name,
    required this.temperament, required this.life_span,
    required this.bred_for, required this.reference_image_id,
    required this.weight, required this.height});
}