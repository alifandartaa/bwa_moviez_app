import 'dart:ui';

import 'package:bwa_moviez_app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'rating_item.dart';

class FeaturedItemCard extends StatelessWidget {
  final String title;
  final String genre;
  final String imageUrl;
  final int rating;

  const FeaturedItemCard(
      {Key? key,
      required this.title,
      required this.genre,
      required this.imageUrl,
      this.rating = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 207,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 27,
                  top: 188,
                  child: Container(
                    height: 23,
                    width: 244,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: const Color(0xff5E38E5).withOpacity(0.4),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        height: 23,
                        width: 244,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imageUrl),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: avenirHeavy.copyWith(
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      genre,
                      style: avenirBook.copyWith(
                        fontSize: 16,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [1, 2, 3, 4, 5].map((index) {
                    return RatingItem(
                      index: index,
                      rating: rating,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
