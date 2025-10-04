import 'package:flutter/material.dart';
import 'package:resturant_app1/models/food.dart';

class Mybar extends StatelessWidget {
  final TabController tabcontoller;
  const Mybar({super.key, required this.tabcontoller});

  List<Tab> _buildCatogerytab() {
    return FoodCategory.values.map((category) {
      return Tab(text: category.toString().split('.').last);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(controller: tabcontoller, tabs: _buildCatogerytab()),
    );
  }
}
