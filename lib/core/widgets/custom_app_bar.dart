import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(71.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/navBar/Cats.svg',
              width: screenWidth * 0.14,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cats');
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/navBar/Breeds.svg',
              width: screenWidth * 0.14,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/breeds');
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/navBar/Dogs.svg',
              width: screenWidth * 0.14,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/dogs');
            },
          ),
        ],
      ),
    );
  }
}