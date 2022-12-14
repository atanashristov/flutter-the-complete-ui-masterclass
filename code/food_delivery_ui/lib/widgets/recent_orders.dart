import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/order.dart';
import 'package:food_delivery_ui/widgets/plus_button.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Recent Orders',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        _OrdersList(),
      ],
    );
  }
}

class _OrdersList extends StatelessWidget {
  const _OrdersList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: ListView.builder(
        // Add Android specific bouncing physics
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        //physics: const AlwaysScrollableScrollPhysics(),
        itemCount: currentUser.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return _OrdersListItem(
            order: currentUser.orders[index],
            index: index,
          );
        },
      ),
    );
  }
}

class _OrdersListItem extends StatelessWidget {
  const _OrdersListItem({
    required this.order,
    required this.index,
  });

  final Order order;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(index == 0 ? 0 : 8.0, 8.0, 8.0, 8.0),
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
                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const PlusButton(margin: EdgeInsets.only(right: 20.0)),
        ],
      ),
    );
  }
}
