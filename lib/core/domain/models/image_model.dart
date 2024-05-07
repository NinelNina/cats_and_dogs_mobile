class ImageModel {
  final String id;
  final String url;
  final int width;
  final int height;
  final String? breedId;

  ImageModel(this.breedId, {required this.id, required this.url, required this.width, required this.height});
}