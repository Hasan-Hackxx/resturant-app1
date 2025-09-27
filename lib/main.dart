import 'package:flutter/material.dart';
import 'package:resturant_app1/components/mydrawer.dart';
import 'package:resturant_app1/components/registerorLogin.dart';

void main() {
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
      home: Registerorlogin(),
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
