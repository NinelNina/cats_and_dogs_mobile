import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/image_model.dart';
import '../../../domain/services/cat_images_service.dart';
import 'image_event.dart';
import 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final bool isCat;

  ImageBloc(this.isCat) : super(ImageInitial()) {
    on<FetchImage>(_onFetchImage);
  }

  Future<void> _onFetchImage(FetchImage event, Emitter<ImageState> emit) async {
    if (state is ImageLoading) return;

    final currentState = state;
    List<ImageModel> images = [];
    int? nextPage = event.page;

    if (currentState is ImageLoaded) {
      images = currentState.images;
      nextPage = currentState.page != null ? currentState.page! + 1 : null;
    }

    try {
      final newImages = isCat
          ? await ImagesService.getCatImages(event.order, event.limit, nextPage)
          : await ImagesService.getDogImages(event.order, event.limit, nextPage);

      final hasReachedMax = newImages.isEmpty;

      emit(
        ImageLoaded(
          images: images + newImages,
          hasReachedMax: hasReachedMax,
          page: nextPage,
        ),
      );
    } catch (e) {
      emit(ImageError("Failed to fetch image"));
    }
  }
}
