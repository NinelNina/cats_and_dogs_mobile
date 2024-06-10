import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/start_button.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFEDD5C0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),*/
          Container(
            width: screenWidth,
            height: screenHeight * 0.55,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/start_picture.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55.0),
                bottomRight: Radius.circular(55.0),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth * 0.8,
            height: screenHeight * 0.17,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            child:
              Text(
                'Browse cute pet photos and learn about their personalities',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "LexendDeca",
                  fontWeight: FontWeight.normal,
                  fontSize: screenHeight * 0.026,
                  height: 1.25,
                  color: Color(0xFF583E26),
                ),
              ),
            width: screenWidth * 0.92,
            height: screenHeight * 0.067,),
          SizedBox(height: screenHeight * 0.03),
          StartButton(path: '/choose_pet', width: screenWidth * 0.74, height: screenHeight * 0.07, text: 'Get started'),
        ],
      ),
    );
  }
}
