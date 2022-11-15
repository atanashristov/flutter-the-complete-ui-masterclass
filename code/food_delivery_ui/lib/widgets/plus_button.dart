import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({super.key, this.margin});

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(30.0)),
      child: IconButton(
        icon: const Icon(Icons.add),
        color: Colors.white,
        iconSize: 24.0,
        onPressed: () {},
      ),
    );
  }
}
