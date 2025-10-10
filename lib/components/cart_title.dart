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
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name food
                    Text(cartitem.food.name),
                    //food price
                    Text(cartitem.food.price.toString()),
                  ],
                ),
                Spacer(),
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

                //addon
                SizedBox(
                  height: cartitem.selectedAddon.isEmpty ? 0 : 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cartitem.selectedAddon
                        .map(
                          (addon) => FilterChip(
                            label: Row(
                              children: [
                                //addon name
                                Text(addon.name),
                                //addon price
                                Text('\$' + addon.price.toString()),
                              ],
                            ),
                            onSelected: (value) {},
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
