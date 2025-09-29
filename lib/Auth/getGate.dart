import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resturant_app1/components/registerorLogin.dart';
import 'package:resturant_app1/main.dart';

class Getgate extends StatefulWidget {
  const Getgate({super.key});

  @override
  State<Getgate> createState() => _GetgateState();
}

class _GetgateState extends State<Getgate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return Registerorlogin();
          }
        },
      ),
    );
  }
}
