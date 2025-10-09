import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app1/components/myButton.dart';
import 'package:resturant_app1/models/food.dart';
import 'package:resturant_app1/models/resturant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addons, bool> selectedAddon = {};
  FoodPage({super.key, required this.food}) {
    for (Addons addon in food.avalibleaddon) {
      selectedAddon[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addtoCart(Food food, Map<Addons, bool> selectedAddon) {
    Navigator.pop(context);

    List<Addons> currentlyselectedaddon = [];
    for (Addons addon in widget.food.avalibleaddon) {
      if (widget.selectedAddon[addon] == true) {
        currentlyselectedaddon.add(addon);
      }
    }
    context.read<Resturant>().addtoCart(food, currentlyselectedaddon);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          //backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //image for food
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 223, 221, 221),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(25),
                  child: Image.asset(widget.food.imagePath, height: 300),
                ),
              ),

              //name food
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      widget.food.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),

                    //price food
                    Text(
                      '\$' + widget.food.price.toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    //food description
                    Text(
                      widget.food.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),

                    Divider(color: Colors.grey),

                    Text(
                      'Add-on:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    //food addons
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        itemCount: widget.food.avalibleaddon.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Addons addon = widget.food.avalibleaddon[index];
                          return CheckboxListTile(
                            title: Text(
                              addon.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              '\$' + addon.price.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            value: widget.selectedAddon[addon],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.selectedAddon[addon] = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Mybutton(
                onTap: () => addtoCart(widget.food, widget.selectedAddon),
                text: 'Add to cart',
              ),
            ],
          ),
        ),

        //button
        SafeArea(
          child: Opacity(
            opacity: 0.4,
            child: Container(
              margin: EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
