import 'package:flutter/material.dart';

class BreedTile extends StatelessWidget {
  final String breedName;
  final String imagePath;

  BreedTile(this.breedName, this.imagePath);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imagePath),
          radius: screenWidth * 0.08,
        ),
        title: Text(
          breedName,
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            color: Color(0xFF4F3824),
          ),
        ),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Увеличим закругление углов
        ),
      ),
    );
  }
}
