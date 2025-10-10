import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app1/components/cart_title.dart';
import 'package:resturant_app1/models/resturant.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(
      builder: (context, resturant, child) {
        final cartuser = resturant.cart;

        return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text('Cart')),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartuser.length,
                  itemBuilder: (context, index) {
                    final cartitem = cartuser[index];
                    return CartTitle(cartitem: cartitem);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
