import 'package:equatable/equatable.dart';

abstract class BreedEvent extends Equatable {
  const BreedEvent();

  @override
  List<Object> get props => [];
}

class LoadBreeds extends BreedEvent {
  final int limit;
  final int page;

  const LoadBreeds({required this.limit, required this.page});

  @override
  List<Object> get props => [limit, page];
}
