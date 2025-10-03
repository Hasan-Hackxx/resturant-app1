import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});
  void openlocationsearchbox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your location'),
        content: const TextField(decoration: InputDecoration()),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'),
          ),
          MaterialButton(onPressed: () {}, child: Text('save')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          GestureDetector(
            onTap: () => openlocationsearchbox(context),
            child: Row(
              children: [
                //address
                Text(
                  'lattakia 09333',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //icon
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
