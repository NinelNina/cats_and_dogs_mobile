import 'package:equatable/equatable.dart';
import 'package:purrfect_paws/core/domain/models/image_model.dart';

class RandomImageState extends Equatable {
  const RandomImageState();

  @override
  List<Object?> get props => [];
}

class RandomImageInitial extends RandomImageState {}

class RandomImageLoading extends RandomImageState {}

class RandomImageLoaded extends RandomImageState {
  final ImageModel image;

  const RandomImageLoaded(this.image);

  @override
  List<Object?> get props => [image];
}

class RandomImageError extends RandomImageState {
  final String message;

  const RandomImageError(this.message);

  @override
  List<Object?> get props => [message];
}
