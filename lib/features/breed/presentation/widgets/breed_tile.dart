import 'package:flutter/material.dart';

class BreedTile extends StatelessWidget {
  final String breedName;
  final String imagePath;

  BreedTile(this.breedName, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(
          breedName,
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF4F3824),
          ),
        ),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}