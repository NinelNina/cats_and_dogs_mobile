
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomImageWidget extends StatelessWidget {
  final String animalName;
  final String imageUrl;
  const RandomImageWidget({super.key, required this.animalName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            'Get random cute ' + animalName + ' photo',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              imageUrl, // Replace with actual image URL
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(Icons.refresh, color: Colors.brown),
              onPressed: () {
                // Add functionality to refresh the image
              },
            ),
          ),
        ],
      ),
    );
  }
}