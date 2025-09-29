import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resturant_app1/Auth/getGate.dart';
import 'package:resturant_app1/components/mydrawer.dart';
import 'package:resturant_app1/components/registerorLogin.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Page:',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: const Color.fromARGB(255, 199, 198, 198),
      ),
      drawer: Mydrawer(),
    );
  }
}
