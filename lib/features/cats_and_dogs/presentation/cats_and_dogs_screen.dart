import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purrfect_paws/core/widgets/custom_app_bar.dart';
import 'package:purrfect_paws/features/cats_and_dogs/presentation/widgets/infinite_image_list.dart';
import 'package:purrfect_paws/features/cats_and_dogs/presentation/widgets/random_image_widget.dart';

import '../../../core/presentation/bloc/random_image/image_bloc.dart';

class CatsAndDogsScreen extends StatefulWidget {
  final String selectedPet;

  const CatsAndDogsScreen({super.key, required this.selectedPet});

  @override
  State<CatsAndDogsScreen> createState() => _CatsAndDogsScreenState();
}

class _CatsAndDogsScreenState extends State<CatsAndDogsScreen> {
  late String animalKind;

  late String text;

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

    return BlocProvider(
      create: (context) => ImageBloc(widget.selectedPet == 'cats'),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFEDD5C0),
          body: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.013),
                  Center(
                    child: RandomImageWidget(
                      width: screenWidth * 0.95,
                      animalName: animalKind,
                      fontSize: screenHeight * 0.028,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.013),
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
                ],
              ),
              Expanded(
                child: InfiniteImageList(
                  isCat: widget.selectedPet == 'cats',
                  width: screenWidth * 0.95,
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomAppBar(), //TODO: скрытие бара
        ),
      ),
    );
  }
}
