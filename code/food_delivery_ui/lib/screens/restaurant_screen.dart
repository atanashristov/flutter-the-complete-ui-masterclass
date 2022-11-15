// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery_ui/models/food.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/widgets/plus_button.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                      color: Theme.of(context).primaryColor,
                      iconSize: 35.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      '0.2 miles away',
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                RatingStars(rating: widget.restaurant.rating),
                const SizedBox(height: 4.0),
                Text(
                  widget.restaurant.address,
                  style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        textStyle: const TextStyle(fontSize: 20),
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Reviews'),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        textStyle: const TextStyle(fontSize: 20),
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Contact'),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: GridView.count(
                padding: const EdgeInsets.all(10.0),
                crossAxisCount: 2,
                children: List.generate(
                  widget.restaurant.menu.length,
                  (index) {
                    final food = widget.restaurant.menu[index];
                    return _MenuListItem(menuItem: food);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MenuListItem extends StatelessWidget {
  const _MenuListItem({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  final Food menuItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.8),
              ], stops: const [
                0.1,
                0.3,
                0.4,
                0.8,
                0.9
              ]),
            ),
          ),
          Positioned(
            top: 65.0,
            child: Column(
              children: [
                Text(
                  menuItem.name,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$${menuItem.price}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 8.0,
            right: 8.0,
            child: PlusButton(),
          )
        ],
      ),
    );
  }
}
