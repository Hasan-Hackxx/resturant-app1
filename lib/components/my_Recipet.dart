import 'package:flutter/material.dart';

class MyRecipet extends StatelessWidget {
  const MyRecipet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 25,
        right: 25,
        bottom: 25,
        top: 50,
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              'thank your for your oreder...!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 243, 198),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              padding: EdgeInsets.all(25),

              child: Text(
                "Recipet here..",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
