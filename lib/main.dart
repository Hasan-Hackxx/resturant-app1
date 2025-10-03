import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resturant_app1/Auth/getGate.dart';
import 'package:resturant_app1/components/my_current_location.dart';
import 'package:resturant_app1/components/my_description.dart';
import 'package:resturant_app1/components/my_sliver_app_bar.dart';
import 'package:resturant_app1/components/mydrawer.dart';
import 'package:resturant_app1/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, inner) => [
          MySliverAppBar(
            title: Text('title'),
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
        body: Container(color: Colors.blue),
      ),
    );
  }
}
