import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/breeds_list/breeds_list_bloc.dart';
import 'package:purrfect_paws/core/presentation/bloc/breeds_list/breeds_list_event.dart';
import 'package:purrfect_paws/core/presentation/bloc/breeds_list/breeds_list_state.dart';
import 'package:purrfect_paws/core/widgets/custom_app_bar.dart';
import 'package:purrfect_paws/features/breed/presentation/widgets/breed_tile.dart';

class BreedsListScreen extends StatefulWidget {
  @override
  _BreedsListScreenState createState() => _BreedsListScreenState();
}

class _BreedsListScreenState extends State<BreedsListScreen> {
  late BreedBloc _breedBloc;
  bool isCat = true;

  @override
  void initState() {
    super.initState();
    _initializeBloc();
  }

  void _initializeBloc() {
    _breedBloc = BreedBloc(isCat: isCat);
    _breedBloc.add(LoadBreeds(limit: 10, page: 1));
  }

  @override
  void dispose() {
    _breedBloc.close();
    super.dispose();
  }

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
              isSelected: [isCat, !isCat],
              selectedColor: Color(0xFF392818),
              color: Color(0xFF392818),
              fillColor: Color(0xFFE09D3C),
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
              onPressed: (int index) {
                setState(() {
                  isCat = index == 0;
                  _breedBloc.close();
                  _initializeBloc();
                });
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            /*Row(
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
                          minimumSize: Size(screenWidth * 0.08, screenHeight * 0.05),
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
                          minimumSize: Size(screenWidth * 0.08, screenHeight * 0.05),
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
                          minimumSize: Size(screenWidth * 0.08, screenHeight * 0.05),
                        ),
                        child: Text('10'),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                ),
                Icon(Icons.arrow_forward, color: Colors.grey),
              ],
            ),*/
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: BlocBuilder<BreedBloc, BreedState>(
                bloc: _breedBloc,
                builder: (context, state) {
                  if (state is BreedLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is BreedLoaded) {
                    return ListView.builder(
                      itemCount: state.breeds.length,
                      itemBuilder: (context, index) {
                        final breed = state.breeds[index];
                        return BreedTile(breed.name, breed.image!.url);
                      },
                    );
                  } else if (state is BreedError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomAppBar(),
    );
  }
}
