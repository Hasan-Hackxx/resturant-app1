import 'package:flutter/material.dart';
import 'package:resturant_app1/pages/loginPage.dart';
import 'package:resturant_app1/pages/registerPage.dart';

class Registerorlogin extends StatefulWidget {
  const Registerorlogin({super.key});

  @override
  State<Registerorlogin> createState() => _RegisterorloginState();
}

class _RegisterorloginState extends State<Registerorlogin> {
  bool showloginpage = true;

  void togglepages() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return Loginpage(onTap: togglepages);
    } else {
      return Registerpage(onTap: togglepages);
    }
  }
}
