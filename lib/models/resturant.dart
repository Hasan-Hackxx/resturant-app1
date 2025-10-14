import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resturant_app1/components/cart_Item.dart';
import 'package:resturant_app1/models/food.dart';

class Resturant extends ChangeNotifier {
  //food list

  final List<Food> _menu = [
    //Burgers
    Food(
      name: 'Burger1',
      description: 'hasan badour dkkd skskssk cheese ',
      imagePath: 'images/b11.jpg',
      price: 0.99,
      avalibleaddon: [
        Addons(name: 'Extra chesse', price: 1.00),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Burger2',
      description: 'hasan badour dkkd skskssk cheese ',
      imagePath: 'images/b2.jpg',
      price: 0.99,
      avalibleaddon: [
        Addons(name: 'Extra chesse', price: 1.00),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Burger3',
      description: 'hasan badour dkkd skskssk cheese ',
      imagePath: 'images/b3.jpg',
      price: 0.99,
      avalibleaddon: [
        Addons(name: 'Extra chesse', price: 1.00),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.burgers,
    ),

    //drinks
    Food(
      name: 'drink1',
      description: 'my favourite drink is drink1',
      imagePath: 'images/d1.jpg',
      price: 1.99,
      avalibleaddon: [
        Addons(name: 'fruits with drink', price: 0.99),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'drink2',
      description: 'my favourite drink is drink1',
      imagePath: 'images/d2.jpg',
      price: 1.99,
      avalibleaddon: [
        Addons(name: 'fruits with drink', price: 0.99),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'drink3',
      description: 'my favourite drink is drink1',
      imagePath: 'images/d3.jpg',
      price: 1.99,
      avalibleaddon: [
        Addons(name: 'fruits with drink', price: 0.99),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.drinks,
    ),

    // salads
    Food(
      name: 'salad1',
      description: 'salad is the most delesious snak in the resturant',
      imagePath: 'images/s1.jpg',
      price: 3.00,
      avalibleaddon: [
        Addons(name: 'taboola', price: 1.00),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      name: 'salad2',
      description: 'salad is the most delesious snak in the resturant',
      imagePath: 'images/s2.jpg',
      price: 3.00,
      avalibleaddon: [
        Addons(name: 'taboola', price: 1.00),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      name: 'salad3',
      description: 'salad is the most delesious snak in the resturant',
      imagePath: 'images/s3.jpg',
      price: 3.00,
      avalibleaddon: [
        Addons(name: 'taboola', price: 1.00),
        Addons(name: 'jdjddj djdjdjd', price: 2.0),
      ],
      category: FoodCategory.salads,
    ),
  ];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  //user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addtoCart(Food food, List<Addons> selectedAddon) {
    //see if there is a cart item already wit food and selected addon == food and selected addon in the cart
    CartItem? cartitem = _cart.firstWhereOrNull((item) {
      //check if food == food in cart
      bool isfoodsame = item.food == food;

      //check if selected addon == in the cart
      bool isselectedaddonsame = ListEquality().equals(
        item.selectedAddon,
        selectedAddon,
      );

      return isfoodsame && isselectedaddonsame;
    });
    //if cart is exist just increase the quality
    if (cartitem != null) {
      cartitem.quality++;
      // create new cart
    } else {
      _cart.add(CartItem(food: food, selectedAddon: selectedAddon));
    }
    notifyListeners();
  }

  //remove from cart
  void removeItemformcart(CartItem cartitem) {
    int cartindex = _cart.indexOf(cartitem);
    if (cartindex != -1) {
      if (_cart[cartindex].quality > 1) {
        _cart[cartindex].quality--;
      } else {
        _cart.removeAt(cartindex);
      }
    }
    notifyListeners();
  }

  // get total price of cart

  double gettotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemttotal = cartItem.food.price;

      for (Addons addon in cartItem.selectedAddon) {
        itemttotal += addon.price;
      }

      total += itemttotal * cartItem.quality;
    }
    return total;
  }

  //get total numbers of items in cart
  int getItemcount() {
    int totalItemcount = 0;
    for (CartItem cartItem in _cart) {
      totalItemcount += cartItem.quality;
    }
    return totalItemcount;
  }

  // clean cart
  void cleanCart() {
    _cart.clear();
    notifyListeners();
  }

  // generate a reciept

  String displaycartResciept() {
    final reciept = StringBuffer();

    reciept.writeln('Here is your recipt.');
    reciept.writeln();

    final formatdate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    reciept.writeln(formatdate);
    reciept.writeln();
    reciept.writeln('------------');

    for (final cartItem in _cart) {
      reciept.writeln(
        '${cartItem.quality} x ${cartItem.food.name} - ${formatPrice(cartItem.food.price)}',
      );
      if (cartItem.selectedAddon.isNotEmpty) {
        reciept.writeln("addons: ${formatAddons(cartItem.selectedAddon)} ");
      }
      reciept.writeln();
    }
    reciept.writeln('------------');
    reciept.writeln();

    reciept.writeln('total-Items: ${getItemcount()}');
    reciept.writeln('total-Price: ${formatPrice(gettotalPrice())}');
    return reciept.toString();
  }

  //method to format price

  String formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //method to format addons
  String formatAddons(List<Addons> addons) {
    return addons
        .map((addon) => "${addon.name} (${formatPrice(addon.price)})")
        .join(", ");
  }
}
