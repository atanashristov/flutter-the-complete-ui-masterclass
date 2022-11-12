import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 120.0,
          child: ListView.builder(
            // Add Android specific bouncing physics
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            scrollDirection: Axis.horizontal,
            //physics: const AlwaysScrollableScrollPhysics(),
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              return _ResentOrder(
                order: currentUser.orders[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ResentOrder extends StatelessWidget {
  const _ResentOrder({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 320.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey[200]!,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // By adding two Expanded we make sure the content does not exceed the available space.
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    // We are using margin and not padding
                    // If we have padding, long text will continue to the right and
                    // the overflow of the Text() elements will not work.
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          order.date,
                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(30.0)),
            child: IconButton(
              icon: const Icon(Icons.add),
              color: Colors.white,
              iconSize: 30.0,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
