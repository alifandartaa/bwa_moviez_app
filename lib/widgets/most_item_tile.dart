import 'package:bwa_moviez_app/shared/styles.dart';
import 'package:bwa_moviez_app/widgets/rating_item.dart';
import 'package:flutter/material.dart';

class MostItemTile extends StatelessWidget {
  final String title;
  final String genre;
  final String imageUrl;
  final int rating;

  const MostItemTile(
      {Key? key,
      required this.title,
      required this.genre,
      required this.imageUrl,
      this.rating = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 253,
      height: 127,
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: 100,
          height: 127,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
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
              const SizedBox(
                height: 20,
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
      ]),
    );
  }
}
