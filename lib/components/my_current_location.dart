import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app1/models/resturant.dart';

class MyCurrentLocation extends StatelessWidget {
  final TextEditingController textcontoller = TextEditingController();

  MyCurrentLocation({super.key});
  void openlocationsearchbox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your location'),
        content: TextField(
          controller: textcontoller,
          decoration: InputDecoration(hintText: 'Enter your location'),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'),
          ),
          MaterialButton(
            onPressed: () {
              String newAddress = textcontoller.text;
              context.read<Resturant>().updateAddres(newAddress);
              Navigator.pop(context);
              textcontoller.clear();
            },
            child: Text('save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                Consumer<Resturant>(
                  builder: (context, resturnat, child) => Text(
                    resturnat.delevieryaddress,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
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
