import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purrfect_paws/features/cats_and_dogs/presentation/widgets/random_image_widget.dart';

import '../../../core/presentation/bloc/random_image/random_image_bloc.dart';

class CatsAndDogsScreen extends StatefulWidget {
  final bool isCat;

  const CatsAndDogsScreen({super.key, required this.isCat});

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

    if (widget.isCat){
      animalKind = 'cat';
      text = 'Look at these cute cats!';
    } else {
      animalKind = 'dog';
      text = 'Look at these good boys and girls!';
    }

    return BlocProvider(
      create: (context) => ImageBloc(widget.isCat),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFEDD5C0),
          body: SingleChildScrollView(
            child: Column(
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
                    Text(text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "LexendDeca",
                        fontWeight: FontWeight.w300,
                        fontSize: screenHeight * 0.03,
                        height: 1.25,
                        color: Color(0xFF583E26),
                      ),),
                    SizedBox(height: screenHeight * 0.013),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
