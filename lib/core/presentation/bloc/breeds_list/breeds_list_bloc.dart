import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:purrfect_paws/core/domain/models/breed_short.dart';
import 'package:purrfect_paws/core/domain/services/breeds_service.dart';
import 'package:purrfect_paws/core/presentation/bloc/breeds_list/breeds_list_event.dart';
import 'package:purrfect_paws/core/presentation/bloc/breeds_list/breeds_list_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final bool isCat;

  BreedBloc({required this.isCat}) : super(BreedInitial()) {
    on<LoadBreeds>(_onLoadBreeds);
  }

  Future<void> _onLoadBreeds(LoadBreeds event, Emitter<BreedState> emit) async {
    emit(BreedLoading());
    try {
      final breeds = isCat
          ? await BreedsService.getCatsBreedsDescrList(event.limit, event.page)
          : await BreedsService.getDogsBreedsDescrList(event.limit, event.page);
      emit(BreedLoaded(breeds: breeds));
    } catch (e) {
      emit(BreedError(message: e.toString()));
    }
  }
}
