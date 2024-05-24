// image_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/image_model.dart';
import '../../../domain/services/cat_images_service.dart';
import 'random_image_event.dart';
import 'random_image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final bool isCat;

  ImageBloc(this.isCat) : super(ImageInitial()) {
    on<FetchImage>(_onFetchImage);
  }

  void _onFetchImage(FetchImage event, Emitter<ImageState> emit) async {
    emit(ImageLoading());
    if (isCat) {
      try {
        final ImageModel image = await ImagesService.getCatImage(
            event.order, event.limit);
        emit(ImageLoaded(image));
      } catch (e) {
        emit(ImageError("Failed to fetch image"));
      }
    }
    else {
      try {
        final ImageModel image = await ImagesService.getDogImage(
            event.order, event.limit);
        emit(ImageLoaded(image));
      } catch (e) {
        emit(ImageError("Failed to fetch image"));
      }
    }
  }
}
