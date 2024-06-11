import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/random_image_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/random_image_event.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/random_image_state.dart';

class RandomImageWidget extends StatelessWidget {
  final String animalName;
  final double width;
  final double fontSize;

  const RandomImageWidget({super.key, required this.animalName, required this.width, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Get random cute $animalName photo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "LexendDeca",
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                height: 1.25,
                color: Color(0xFF583E26),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          BlocBuilder<RandomImageBloc, RandomImageState>(
            builder: (context, state) {
              if (state is RandomImageLoading) {
                // Show progress indicator for both image and random image loading
                return Center(child: CircularProgressIndicator());
              } else if (state is RandomImageError) {
                return Center(child: Text(state.message));
              } else if (state is RandomImageLoaded) {
                // Handle both loaded states (normal and random)
                final image = state.image;
                return Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: image.width / image.height,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          image.url,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.refresh, color: Color(0xFF583E26), size: 30.0),
                            onPressed: () {
                              BlocProvider.of<RandomImageBloc>(context).add(FetchRandomImage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: Text('Press refresh to load image'));
              }
            },
          ),
        ],
      ),
    );
  }
}


