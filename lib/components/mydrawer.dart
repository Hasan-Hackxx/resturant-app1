import 'package:flutter/material.dart';
import 'package:resturant_app1/pages/settingsPage.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(child: Icon(Icons.lock_open_outlined, size: 60)),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Divider(color: Colors.black),
              ),

              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settingspage()),
                  );
                },
              ),
            ],
          ),

          ListTile(leading: Icon(Icons.logout), title: Text('logout')),
        ],
      ),
    );
  }
}
