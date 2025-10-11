import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app1/components/cart_Item.dart';
import 'package:resturant_app1/components/my_quaintity_selecter.dart';
import 'package:resturant_app1/models/resturant.dart';

class CartTitle extends StatelessWidget {
  final CartItem cartitem;
  const CartTitle({super.key, required this.cartitem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(
      builder: (context, resturant, child) => Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 196, 194, 194),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                //food image
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartitem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name food
                    Text(
                      cartitem.food.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    //food price
                    Text(
                      '\$' + cartitem.food.price.toString(),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(width: 70),
                //decement + incement quantity
                MyQuaintitySelecter(
                  food: cartitem.food,
                  onDecrement: () {
                    resturant.removeItemformcart(cartitem);
                  },
                  onIncrement: () {
                    resturant.addtoCart(cartitem.food, cartitem.selectedAddon);
                  },
                  quality: cartitem.quality,
                ),
              ],
            ),
            //addon
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: cartitem.selectedAddon.isEmpty ? 0 : 60,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cartitem.selectedAddon
                      .map(
                        (addon) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Row(
                              children: [
                                //addon name
                                Text(addon.name),
                                SizedBox(width: 10),
                                //addon price
                                Text(
                                  '\$' + addon.price.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(color: Colors.black),
                            ),
                            onSelected: (value) {},
                            backgroundColor: Colors.amber,
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
