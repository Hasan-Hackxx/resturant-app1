import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool unscure;
  const Mytextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.unscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: unscure,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
