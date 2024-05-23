import 'package:cats_facts/features/common/widgets/random_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatsAndDogsScreen extends StatelessWidget {
  final String title;
  final String text;

  const CatsAndDogsScreen({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(child: Scaffold(
      backgroundColor: const Color(0xFFEDD5C0),
      body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
          Column(children: [
            SizedBox(height: screenHeight * 0.013),
            RandomImageWidget(animalName: title, imageUrl: 'imageUrl'),
            SizedBox(height: screenHeight * 0.013),
            Text(text),
            SizedBox(height: screenHeight * 0.013),
          ],)],),
    )));
  }
}
