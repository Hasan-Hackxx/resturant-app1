import 'package:flutter/material.dart';
import 'package:resturant_app1/components/my_Recipet.dart';

class Deliverypage extends StatelessWidget {
  const Deliverypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Delivery in Progress'),
        backgroundColor: const Color.fromARGB(255, 196, 195, 195),
      ),
      bottomNavigationBar: _buildbottomNavigator(context),
      body: Column(children: [MyRecipet()]),
    );
  }

  Widget _buildbottomNavigator(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 190, 190, 190),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 253, 253),
              shape: BoxShape.circle,
            ),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                'Mitch koko',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Deliver',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 129, 129, 129),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 253, 253),
                  shape: BoxShape.circle,
                ),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.message)),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 253, 253),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    color: const Color.fromARGB(255, 70, 168, 73),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
