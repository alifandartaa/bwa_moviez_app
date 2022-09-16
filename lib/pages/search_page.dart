import 'package:bwa_moviez_app/shared/styles.dart';
import 'package:bwa_moviez_app/widgets/most_item_tile.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class SearchPage extends StatefulWidget {
  static const routeName = 'search-page';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  List<Movie> currentList = [];
  List<Movie> originList = [];
  List<Movie> movieSearchList = [];

  @override
  void initState() {
    originList.add(Movie(
        title: 'John Wick',
        genre: 'Action, Crime',
        imageUrl: 'assets/images/moviez_image1.png',
        rating: 5));
    originList.add(Movie(
        title: 'Bohemian',
        genre: 'Documentary',
        imageUrl: 'assets/images/moviez_image2.png',
        rating: 3));
    originList.add(Movie(
        title: 'Mulan Session',
        genre: 'History, War',
        imageUrl: 'assets/images/moviez_image3.png',
        rating: 3));
    originList.add(Movie(
        title: 'Beauty & Beast',
        genre: 'Sci-Fiction',
        imageUrl: 'assets/images/moviez_image4.png',
        rating: 5));
    originList.add(Movie(
        title: 'The Dark II',
        genre: 'Horror',
        imageUrl: 'assets/images/moviez_image5.png',
        rating: 4));
    originList.add(Movie(
        title: 'The Dark Knight',
        genre: 'Horror',
        imageUrl: 'assets/images/moviez_image6.png',
        rating: 4));
    originList.add(Movie(
        title: 'The Dark Tower',
        genre: 'Horror',
        imageUrl: 'assets/images/moviez_image7.png',
        rating: 4));
    currentList = originList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget searchBar() {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: TextField(
          onChanged: (value) {
            currentList = originList
                .where((element) =>
                    element.title.toLowerCase().contains(value.toLowerCase()))
                .toList();
            setState(() {});
          },
          controller: editingController,
          keyboardType: TextInputType.text,
          style: avenirRoman.copyWith(
            fontSize: 16,
            color: primaryColor,
          ),
          decoration: InputDecoration(
            hintText: 'Search by name',
            prefixIcon: const Icon(Icons.search),
            fillColor: const Color(0xffF6F7FB),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
      );
    }

    Widget searchResult() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search Result (${currentList.length})',
            style: avenirRoman.copyWith(
              fontSize: 20,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: double.infinity,
              height: 600,
              child: ListView.builder(
                  itemCount: currentList.length,
                  itemBuilder: (context, index) {
                    return MostItemTile(
                      title: currentList[index].title,
                      genre: currentList[index].genre,
                      imageUrl: currentList[index].imageUrl,
                      rating: currentList[index].rating,
                    );
                  })),
        ],
      );
    }

    Widget buttonSuggest() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 220,
          height: 60,
          margin: EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(37),
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffC4C8D7).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ]),
          child: Center(
            child: Text(
              'Suggest Movie',
              style: avenirMedium.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 117,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: 279,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle, color: Color(0xffFBFBFD)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
              child: SingleChildScrollView(
                child: Column(children: [
                  searchBar(),
                  const SizedBox(
                    height: 35,
                  ),
                  searchResult(),
                ]),
              ),
            ),
            buttonSuggest(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {}, label: Text('Suggest Movie')),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
