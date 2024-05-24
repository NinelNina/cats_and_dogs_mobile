// image_state.dart
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
  final ImageModel image;

  const ImageLoaded(this.image);

  @override
  List<Object?> get props => [image];
}

class ImageError extends ImageState {
  final String message;

  const ImageError(this.message);

  @override
  List<Object?> get props => [message];
}
