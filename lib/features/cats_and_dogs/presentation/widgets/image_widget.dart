import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/image_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/random_image/image_state.dart';

class ImageWidget extends StatelessWidget {
  final double width;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;

  const ImageWidget({
    Key? key,
    required this.width,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
  }) : super(key: key);

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
        child: Column(children: [
          BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
            if (state is ImageLoading) {
              // Show progress indicator for both image and random image loading
              return Center(child: CircularProgressIndicator());
            } else if (state is ImageError) {
              return Center(child: Text(state.message));
            } else if (state is ImageLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: imageWidth.toDouble() / imageHeight.toDouble(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
        ]));
  }
}
