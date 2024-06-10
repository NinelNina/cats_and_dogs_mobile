import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object?> get props => [];
}

class FetchImage extends ImageEvent {
  final String order;
  final int limit;
  final int? page;

  const FetchImage(this.order, this.limit, this.page);

  @override
  List<Object?> get props => [order, limit, page];
}
