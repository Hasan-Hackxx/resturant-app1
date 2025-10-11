import 'package:flutter/material.dart';
import 'package:resturant_app1/components/my_Recipet.dart';

class Deliverypage extends StatelessWidget {
  const Deliverypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Delivery Page'),
        backgroundColor: const Color.fromARGB(255, 196, 195, 195),
      ),
      body: Column(children: [MyRecipet()]),
    );
  }
}
