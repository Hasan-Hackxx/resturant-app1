class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addons> avalibleaddon;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.avalibleaddon,
    required this.category,
  });
}

enum FoodCategory { burgers, drinks, salads }

class Addons {
  final String name;
  final double price;

  Addons({required this.name, required this.price});
}
