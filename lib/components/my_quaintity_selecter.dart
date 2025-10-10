import 'package:flutter/material.dart';
import 'package:resturant_app1/models/food.dart';

class MyQuaintitySelecter extends StatelessWidget {
  final int quality;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const MyQuaintitySelecter({
    super.key,
    required this.food,
    required this.onDecrement,
    required this.onIncrement,
    required this.quality,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //button decemant
          GestureDetector(
            onTap: onDecrement,
            child: Icon(Icons.remove, size: 20, color: Colors.grey),
          ),
          //food quantity
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 20,
              child: Center(child: Text(quality.toString())),
            ),
          ),

          //button incement
          GestureDetector(
            onTap: onIncrement,
            child: Icon(Icons.add, size: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
