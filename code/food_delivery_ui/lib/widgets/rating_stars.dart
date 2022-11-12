import 'package:flutter/material.dart';

const _kStarSize = 24.0;
const _kStarColor = Colors.amber;

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating});

  final int rating;

  List<Widget> _listOfStars(int currentRating, int maxRating) {
    List<Widget> stars = [];
    for (int i = 0; i < currentRating && i < maxRating; i++) {
      stars.add(
        const Icon(Icons.star_rate_rounded, color: _kStarColor, size: _kStarSize),
      );
      // stars.add(
      //   Text(
      //     String.fromCharCode(Icons.star_rate_rounded.codePoint),
      //     style: TextStyle(
      //       fontFamily: Icons.details.fontFamily,
      //       package: Icons.details.fontPackage,
      //       fontSize: _kStarSize,
      //       color: _kStarColor,
      //     ),
      //   ),
      // );
    }

    while (stars.length < maxRating) {
      stars.add(
        const Icon(Icons.star_rate_outlined, color: _kStarColor, size: _kStarSize),
      );
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _listOfStars(rating, 5),
    );
  }
}
