import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app1/components/cart_title.dart';
import 'package:resturant_app1/components/myButton.dart';
import 'package:resturant_app1/models/resturant.dart';
import 'package:resturant_app1/pages/paymentPage.dart';

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
          appBar: AppBar(
            centerTitle: true,
            title: Text('Cart'),
            actions: [
              IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Are you sure you want to delete your orders!..',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          resturant.cleanCart();
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  ),
                ),
                icon: Icon(Icons.delete),
              ),
            ],
          ),

          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: cartuser.isEmpty
                          ? Center(
                              child: const Text(
                                'Cart is empty...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: cartuser.length,
                              itemBuilder: (context, index) {
                                final cartitem = cartuser[index];
                                return CartTitle(cartitem: cartitem);
                              },
                            ),
                    ),
                  ],
                ),
              ),
              Mybutton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Paymentpage()),
                ),
                text: 'Go to Checkout',
              ),
              SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
