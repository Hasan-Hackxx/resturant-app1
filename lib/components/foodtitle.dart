import 'package:flutter/material.dart';
import 'package:resturant_app1/models/food.dart';

class Foodtitle extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const Foodtitle({super.key, required this.onTap, required this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(food.name),
                    Text('\$' + food.price.toString()),
                    Text(food.description),
                  ],
                ),
              ),

              Image.asset(food.imagePath, height: 80, width: 80),
            ],
          ),
        ),
      ],
    );
  }
}
