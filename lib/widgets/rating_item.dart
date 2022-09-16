import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  const RatingItem({Key? key, required this.index, required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/images/filled_star_icon.png'
          : 'assets/images/unfilled_star_icon.png',
      width: 20,
    );
  }
}
