import 'package:flutter/material.dart';
import 'package:purrfect_paws/core/widgets/custom_app_bar.dart';
import 'package:purrfect_paws/features/breed/presentation/widgets/breed_tile.dart';

class BreedsListScreen extends StatefulWidget {
  @override
  _BreedsListScreenState createState() => _BreedsListScreenState();
}

class _BreedsListScreenState extends State<BreedsListScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5E3D2),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5E3D2),
        elevation: 0,
        toolbarHeight: screenHeight * 0.06,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              isSelected: [true, false],
              selectedColor: Colors.white,
              color: Colors.black,
              fillColor: Color(0xFFD9A772),
              borderRadius: BorderRadius.circular(30),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text('Cats'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Text('Dogs'),
                ),
              ],
              onPressed: (int index) {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back, color: Colors.grey),
                Row(
                  children: List.generate(4, (index) {
                    if (index == 2) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        child: Text('...', style: TextStyle(color: Colors.grey)),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(screenWidth * 0.08, screenHeight * 0.05), // Задаем минимальную ширину и высоту кнопок
                        ),
                        child: Text('${index + 1}'),
                        onPressed: () {},
                      ),
                    );
                  })..addAll([
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(screenWidth * 0.08, screenHeight * 0.05), // Задаем минимальную ширину и высоту кнопок
                        ),
                        child: Text('9'),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(screenWidth * 0.08, screenHeight * 0.05), // Задаем минимальную ширину и высоту кнопок
                        ),
                        child: Text('10'),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ),
                Icon(Icons.arrow_forward, color: Colors.grey),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView(
                children: [
                  BreedTile('Abyssinian', 'assets/abyssinian.png'),
                  BreedTile('Aegean', 'assets/aegean.png'),
                  BreedTile('American Bobtail', 'assets/american_bobtail.png'),
                  BreedTile('American Curl', 'assets/american_curl.png'),
                  BreedTile('American Shorthair', 'assets/american_shorthair.png'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomAppBar(),
    );
  }
}

class BreedTile extends StatelessWidget {
  final String breedName;
  final String imagePath;

  BreedTile(this.breedName, this.imagePath);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: ListTile( //TODO: заменить на BreedTile
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
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
