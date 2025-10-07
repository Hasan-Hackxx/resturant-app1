import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app1/Auth/getGate.dart';
import 'package:resturant_app1/components/foodtitle.dart';
import 'package:resturant_app1/components/my_current_location.dart';
import 'package:resturant_app1/components/my_description.dart';
import 'package:resturant_app1/components/my_sliver_app_bar.dart';
import 'package:resturant_app1/components/mybar.dart';
import 'package:resturant_app1/components/mydrawer.dart';
import 'package:resturant_app1/components/test.dart';
import 'package:resturant_app1/firebase_options.dart';
import 'package:resturant_app1/models/food.dart';
import 'package:resturant_app1/models/resturant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Resturant(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Getgate(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filtermenubyCategory(FoodCategory category, List<Food> fullmenu) {
    return fullmenu.where((food) => food.category == category).toList();
  }

  List<Widget> getfoodInthiscategory(List<Food> fullmenu) {
    return FoodCategory.values.map((category) {
      List<Food> categorymeny = _filtermenubyCategory(category, fullmenu);

      return ListView.builder(
        itemCount: categorymeny.length,
        itemBuilder: (context, index) {
          final Food food = categorymeny[index];
          return Foodtitle(onTap: () {}, food: food);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, inner) => [
          MySliverAppBar(
            title: Mybar(tabcontoller: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(color: Colors.grey, indent: 25, endIndent: 25),
                //my current location
                MyCurrentLocation(),
                //description box
                MyDescription(),
              ],
            ),
          ),
        ],
        body: Consumer<Resturant>(
          builder: (context, resturnat, child) => TabBarView(
            controller: _tabController,
            children: getfoodInthiscategory(resturnat.menu),
          ),
        ),
      ),
    );
  }
}
