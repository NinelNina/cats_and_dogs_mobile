import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purrfect_paws/core/domain/services/cat_images_service.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/image_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/image_event.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/image_state.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/random_image_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/random_image_event.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/random_image_state.dart';
import 'package:purrfect_paws/core/widgets/custom_app_bar.dart';
import 'package:purrfect_paws/features/cats_and_dogs/presentation/widgets/image_widget.dart';
import 'package:purrfect_paws/features/cats_and_dogs/presentation/widgets/random_image_widget.dart';

class CatsAndDogsScreen extends StatefulWidget {
  final String selectedPet;

  const CatsAndDogsScreen({Key? key, required this.selectedPet})
      : super(key: key);

  @override
  State<CatsAndDogsScreen> createState() => _CatsAndDogsScreenState();
}

class _CatsAndDogsScreenState extends State<CatsAndDogsScreen> {
  late String animalKind;
  late String text;
  late ImageBloc _imageBloc;
  late RandomImageBloc _randomImageBloc;
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _imageBloc = ImageBloc(widget.selectedPet == 'cats');
    _randomImageBloc = RandomImageBloc(
        widget.selectedPet == 'cats'); // Assuming ImagesService injection
    _randomImageBloc
        .add(FetchRandomImage()); // Fetch random image on first load
    _imageBloc.add(FetchImage('RND', 10, _currentPage));
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    if (widget.selectedPet == 'cats') {
      animalKind = 'cat';
      text = 'Look at these cute cats!';
    } else {
      animalKind = 'dog';
      text = 'Look at these good boys and girls!';
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _imageBloc),
        BlocProvider.value(value: _randomImageBloc),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFEDD5C0),
          body: ListView(
            controller: _scrollController,
            children: [
              BlocBuilder<RandomImageBloc, RandomImageState>(
                builder: (context, randomState) {
                  return Column(
                    children: [
                      SizedBox(height: screenHeight * 0.013),
                      RandomImageWidget(
                        width: screenWidth * 0.95,
                        animalName: animalKind,
                        fontSize: screenHeight * 0.028,
                      ),
                      SizedBox(height: screenHeight * 0.013),
                    ],
                  );
                },
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "LexendDeca",
                  fontWeight: FontWeight.w300,
                  fontSize: screenHeight * 0.03,
                  height: 1.25,
                  color: Color(0xFF583E26),
                ),
              ),
              SizedBox(height: screenHeight * 0.013),
              BlocBuilder<ImageBloc, ImageState>(
                bloc: _imageBloc,
                builder: (context, state) {
                  if (state is ImageLoading && _currentPage == 0) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is ImageLoaded) {
                    _currentPage = state.page ?? 0;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.hasReachedMax
                          ? state.images.length
                          : state.images.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= state.images.length) {
                          return Center(child: CircularProgressIndicator());
                        }

                        final image = state.images[index];
                        return Column(children: [
                          ImageWidget(
                            width: screenWidth * 0.95,
                            imageUrl: image.url,
                            imageWidth: image.width,
                            imageHeight: image.height,
                          ),
                          SizedBox(height: 10.0)
                        ]);
                      },
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
          bottomNavigationBar: CustomAppBar(),
        ),
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      _imageBloc.add(FetchImage('RND', 10, _currentPage + 1));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _imageBloc.close();
    _randomImageBloc.close();
    super.dispose();
  }
}
