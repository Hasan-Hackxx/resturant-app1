import 'package:flutter/material.dart';
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
      avalibleaddon: [Addons(name: 'Extra chesse', price: 1.00)],
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Burger2',
      description: 'hasan badour dkkd skskssk cheese ',
      imagePath: 'images/b2.jpg',
      price: 0.99,
      avalibleaddon: [Addons(name: 'Extra chesse', price: 1.00)],
      category: FoodCategory.burgers,
    ),
    Food(
      name: 'Burger3',
      description: 'hasan badour dkkd skskssk cheese ',
      imagePath: 'images/b3.jpg',
      price: 0.99,
      avalibleaddon: [Addons(name: 'Extra chesse', price: 1.00)],
      category: FoodCategory.burgers,
    ),

    //drinks
    Food(
      name: 'drink1',
      description: 'my favourite drink is drink1',
      imagePath: 'images/d1.jpg',
      price: 1.99,
      avalibleaddon: [Addons(name: 'fruits with drink', price: 0.99)],
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'drink2',
      description: 'my favourite drink is drink1',
      imagePath: 'images/d2.jpg',
      price: 1.99,
      avalibleaddon: [Addons(name: 'fruits with drink', price: 0.99)],
      category: FoodCategory.drinks,
    ),
    Food(
      name: 'drink3',
      description: 'my favourite drink is drink1',
      imagePath: 'images/d3.jpg',
      price: 1.99,
      avalibleaddon: [Addons(name: 'fruits with drink', price: 0.99)],
      category: FoodCategory.drinks,
    ),

    // salads
    Food(
      name: 'salad1',
      description: 'salad is the most delesious snak in the resturant',
      imagePath: 'images/s1.jpg',
      price: 3.00,
      avalibleaddon: [Addons(name: 'taboola', price: 1.00)],
      category: FoodCategory.salads,
    ),
    Food(
      name: 'salad2',
      description: 'salad is the most delesious snak in the resturant',
      imagePath: 'images/s2.jpg',
      price: 3.00,
      avalibleaddon: [Addons(name: 'taboola', price: 1.00)],
      category: FoodCategory.salads,
    ),
    Food(
      name: 'salad3',
      description: 'salad is the most delesious snak in the resturant',
      imagePath: 'images/s3.jpg',
      price: 3.00,
      avalibleaddon: [Addons(name: 'taboola', price: 1.00)],
      category: FoodCategory.salads,
    ),
  ];

  List<Food> get menu => _menu;

  // add to cart

  //remove from cart

  // get total price of cart

  //get total numbers of items in cart

  // clean cart
}
