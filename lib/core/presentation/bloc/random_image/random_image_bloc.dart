import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purrfect_paws/core/domain/models/image_model.dart';
import 'package:purrfect_paws/core/domain/services/cat_images_service.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/random_image_event.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/random_image_state.dart';

class RandomImageBloc extends Bloc<RandomImageEvent, RandomImageState> {
  final bool isCat;

  RandomImageBloc(this.isCat) : super(RandomImageInitial()) {
    on<FetchRandomImage>(_onFetchRandomImage);
  }

  Future<void> _onFetchRandomImage(FetchRandomImage event, Emitter<RandomImageState> emit) async {
    emit(RandomImageLoading());
    try {
      final ImageModel image = isCat ? await ImagesService.getRandomCatImage() : await ImagesService.getRandomDogImage();
      emit(RandomImageLoaded(image));
    } catch (e) {
      emit(const RandomImageError("Failed to fetch random image"));
    }
  }
}
