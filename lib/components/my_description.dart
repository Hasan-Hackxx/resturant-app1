import 'package:flutter/material.dart';

class MyDescription extends StatelessWidget {
  const MyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      margin: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //delivery fee
                Text('\$0.99'),
                Text('Delivery fee'),
              ],
            ),
            Column(
              children: [
                //delivery fee
                Text('15-30 min'),
                Text('Delivery time'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
