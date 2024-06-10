import 'dart:io';

import 'package:flutter/material.dart';
import 'package:purrfect_paws/core/common/http_overrides.dart';
import 'features/breed/presentation/breeds_list_screen.dart';
import 'features/cats_and_dogs/presentation/cats_and_dogs_screen.dart';
import 'features/favorite_pet/presentation/favorite_pet_screen.dart';
import 'features/start/presentation/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/choose_pet': (context) => FavoritePetScreen(),
        '/cats': (context) => CatsAndDogsScreen(selectedPet: 'cats'),
        '/dogs': (context) => CatsAndDogsScreen(selectedPet: 'dogs'),
        '/breeds': (context) => BreedsListScreen(),
        /*'/breeds/cat/{id}': (context) => CatBreedScreen(),
        '/breeds/dog/{id}': (context) => DogBreedScreen()*/
      },
      debugShowCheckedModeBanner: false,
      title: 'Purrfect Paws',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: FutureBuilder(
        future: getStartScreen(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data ?? CircularProgressIndicator();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<Widget> getStartScreen() async {
    final prefs = await SharedPreferences.getInstance();

    //final bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    final String selectedPet = prefs.getString('selectedPet') ?? '';

    if (selectedPet.isEmpty) {
      //await prefs.setBool('isFirstLaunch', false);
      return StartScreen();
    } else {
      return CatsAndDogsScreen(selectedPet: selectedPet);
    }
  }
}