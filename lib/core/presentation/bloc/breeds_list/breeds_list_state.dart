import 'package:equatable/equatable.dart';
import 'package:purrfect_paws/core/domain/models/breed_short.dart';

abstract class BreedState extends Equatable {
  const BreedState();

  @override
  List<Object> get props => [];
}

class BreedInitial extends BreedState {}

class BreedLoading extends BreedState {}

class BreedLoaded extends BreedState {
  final List<BreedShort> breeds;

  const BreedLoaded({required this.breeds});

  @override
  List<Object> get props => [breeds];
}

class BreedError extends BreedState {
  final String message;

  const BreedError({required this.message});

  @override
  List<Object> get props => [message];
}