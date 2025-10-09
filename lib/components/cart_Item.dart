import 'package:resturant_app1/models/food.dart';

class CartItem {
  final Food food;
  List<Addons> selectedAddon;
  int quality;

  CartItem({required this.food, required this.selectedAddon, this.quality = 1});

  double get totalePrice {
    double addonprice = selectedAddon.fold(
      0,
      (sum, addon) => sum + addon.price,
    );
    return (food.price + addonprice) * quality;
  }
}
