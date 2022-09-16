import 'package:bwa_moviez_app/pages/search_page.dart';
import 'package:bwa_moviez_app/shared/styles.dart';
import 'package:bwa_moviez_app/widgets/featured_item_card.dart';
import 'package:bwa_moviez_app/widgets/most_item_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        height: 64,
        margin: const EdgeInsets.only(bottom: 27),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Moviez',
                style: avenirBlack.copyWith(
                  fontSize: 28,
                  color: primaryColor,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Watch much easier',
                style: avenirBook.copyWith(
                  fontSize: 16,
                  color: greyColor,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: const Icon(
              Icons.search,
              size: 22,
            ),
          ),
        ]),
      );
    }

    Widget featured() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            FeaturedItemCard(
              title: 'John Wick',
              genre: 'Action, Crime',
              imageUrl: 'assets/images/moviez_image1.png',
              rating: 4,
            ),
            FeaturedItemCard(
              title: 'Bohemian',
              genre: 'Documentary',
              imageUrl: 'assets/images/moviez_image2.png',
              rating: 3,
            ),
          ],
        ),
      );
    }

    Widget most() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From Disney',
            style: avenirBlack.copyWith(
              fontSize: 24,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: const [
              MostItemTile(
                title: 'Mulan Session',
                genre: 'History, War',
                imageUrl: 'assets/images/moviez_image3.png',
                rating: 3,
              ),
              MostItemTile(
                title: 'Beauty & Beast',
                genre: 'Sci-Fiction',
                imageUrl: 'assets/images/moviez_image4.png',
                rating: 5,
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: -164,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: 279,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xffFBFBFD),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.only(top: 29, left: 24),
              children: [
                header(),
                featured(),
                const SizedBox(
                  height: 30,
                ),
                most(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
