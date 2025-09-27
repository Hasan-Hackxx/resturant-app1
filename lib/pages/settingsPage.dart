import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings', style: TextStyle(fontWeight: FontWeight.w900)),
        backgroundColor: const Color.fromARGB(255, 214, 213, 213),
      ),
    );
  }
}
