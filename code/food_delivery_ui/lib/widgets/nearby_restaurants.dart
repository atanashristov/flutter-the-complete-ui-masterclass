import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Nearby Restaurants',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 12.0),
        _RestaurantsList(),
      ],
    );
  }
}

class _RestaurantsList extends StatelessWidget {
  const _RestaurantsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...restaurants.asMap().entries.map(
              (e) => _RestaurantsListItem(
                restaurant: e.value,
                index: e.key,
              ),
            ),
      ],
    );
  }
}

class _RestaurantsListItem extends StatelessWidget {
  const _RestaurantsListItem({required this.restaurant, required this.index});

  final Restaurant restaurant;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 0 : 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.0, color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              height: 130.0,
              width: 130.0,
              image: AssetImage(restaurant.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  RatingStars(rating: restaurant.rating),
                  const SizedBox(height: 4.0),
                  Text(
                    restaurant.address,
                    style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                    //overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  const Text(
                    '1.2 miles away',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
