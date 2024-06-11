import 'package:equatable/equatable.dart';

abstract class RandomImageEvent extends Equatable {
  const RandomImageEvent();

  @override
  List<Object?> get props => [];
}

class FetchRandomImage extends RandomImageEvent {
  const FetchRandomImage();
}