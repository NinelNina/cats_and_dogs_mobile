import 'package:equatable/equatable.dart';
import '../../../domain/models/image_model.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object?> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<ImageModel> images;
  final bool hasReachedMax;
  final int? page;

  const ImageLoaded({
    required this.images,
    required this.hasReachedMax,
    this.page,
  });

  ImageLoaded copyWith({
    List<ImageModel>? images,
    bool? hasReachedMax,
    int? page,
  }) {
    return ImageLoaded(
      images: images ?? this.images,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [images, hasReachedMax, page];
}

class ImageError extends ImageState {
  final String message;

  const ImageError(this.message);

  @override
  List<Object?> get props => [message];
}
