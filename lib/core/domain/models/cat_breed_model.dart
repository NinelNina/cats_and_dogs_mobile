import 'package:cats_facts/core/domain/models/physical_parameter.dart';

class CatBreed
{
  final String id;
  final String name;
  final String alt_names;
  final String vetstreet_url;
  final String wikipedia_url;
  final String temperament;
  final String origin;
  final String country_code;
  final String description;
  final String life_span;
  final String reference_image_id;
  final PhysicalParameter weight;
  final int indoor;
  final int lap;
  final int adaptability;
  final int affection_level;
  final int child_friendly;
  final int dog_friendly;
  final int grooming;
  final int health_issues;
  final int intelligence;
  final int shedding_level;
  final int social_needs;
  final int stranger_friendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressed_tail;
  final int short_legs;
  final int hypoallergenic;

  CatBreed(this.weight, {required this.id, required this.name, required this.alt_names,
    required this.vetstreet_url, required this.wikipedia_url,
    required this.temperament, required this.origin,
    required this.country_code, required this.description,
    required this.life_span, required this.reference_image_id,
    required this.indoor, required this.lap, required this.adaptability,
    required this.affection_level, required this.child_friendly,
    required this.dog_friendly, required this.grooming,
    required this.health_issues, required this.intelligence,
    required this.shedding_level, required this.social_needs,
    required this.stranger_friendly, required this.vocalisation,
    required this.experimental, required this.hairless, required this.natural,
    required this.rare, required this.rex, required this.suppressed_tail,
    required this.short_legs, required this.hypoallergenic});
}