import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/widgets/start_button.dart';

class FavoritePetScreen extends StatefulWidget {
  const FavoritePetScreen({super.key});

  @override
  _FavoritePetScreenState createState() => _FavoritePetScreenState();
}

class _FavoritePetScreenState extends State<FavoritePetScreen> {
  String _selectedPet = '';

  Future<void> _saveSelectedPet() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedPet', _selectedPet);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return PopScope(
        onPopInvoked: (bool? result) => false,
    child: SafeArea(
    child: Scaffold(
        backgroundColor: const Color(0xFFEDD5C0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Choose your favorite pet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "LexendDeca",
                  fontWeight: FontWeight.normal,
                  fontSize: screenHeight * 0.035,
                  height: 0.9,
                  color: Color(0xFF583E26),
                ),
              ),
              width: screenWidth * 0.81,
              height: screenHeight * 0.08,
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Container(
                height: screenHeight * 0.236,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedPet = _selectedPet == 'cats' ? '' : 'cats';
                        });
                        _saveSelectedPet();
                        Navigator.popAndPushNamed(context, '/cats');
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: _selectedPet == 'cats' ? screenWidth * 0.45 : screenWidth * 0.4,
                        height: _selectedPet == 'cats' ? screenHeight * 0.236 : screenHeight * 0.21,
                        child: SvgPicture.asset(
                          'assets/images/cat.svg',
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedPet = _selectedPet == 'dogs' ? '' : 'dogs';
                        });
                        _saveSelectedPet();
                        Navigator.popAndPushNamed(context, '/dogs');
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: _selectedPet == 'dogs' ? screenWidth * 0.45 : screenWidth * 0.4,
                        height: _selectedPet == 'dogs' ? screenHeight * 0.236 : screenHeight * 0.21,
                        child: SvgPicture.asset(
                          'assets/images/dog.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    ));
  }
}

void main() => runApp(MaterialApp(
  home: FavoritePetScreen(),
));
