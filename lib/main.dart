import 'package:flutter/material.dart';
import 'features/cats_and_dogs/presentation/cats_and_dogs_screen.dart';
import 'features/favorite_pet/presentation/favorite_pet_screen.dart';
import 'features/start/presentation/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/choose_pet': (context) => FavoritePetScreen(),
        '/cats': (context) => CatsAndDogsScreen(isCat: true),
        '/dogs': (context) => CatsAndDogsScreen(isCat: false),
        /*'/breeds': (context) => BreedsScreen(),
        '/breeds/cat/{id}': (context) => CatBreedScreen(),
        '/breeds/dog/{id}': (context) => DogBreedScreen()*/
      },
      debugShowCheckedModeBanner: false,
      title: 'Purrfect Paws',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: StartScreen(),
    );
  }
}