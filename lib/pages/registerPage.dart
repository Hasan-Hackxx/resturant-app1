import 'package:flutter/material.dart';
import 'package:resturant_app1/components/myButton.dart';
import 'package:resturant_app1/components/myTextfield.dart';
import 'package:resturant_app1/main.dart';

class Registerpage extends StatefulWidget {
  final Function()? onTap;
  const Registerpage({super.key, required this.onTap});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void register() {
    //move to homeoage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Register:',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        ),
        backgroundColor: const Color.fromARGB(255, 196, 194, 194),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //icon for Register
            const Icon(Icons.lock_open_outlined, size: 100),
            const SizedBox(height: 10),
            //Text
            const Text(
              'Lets create an account',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 25),
            // Textfield for email
            Mytextfield(hintText: 'Email', controller: _email, unscure: false),

            const SizedBox(height: 20),

            //textField for password
            Mytextfield(
              hintText: 'Password',
              controller: _password,
              unscure: true,
            ),

            const SizedBox(height: 25),

            //button for register
            Mybutton(onTap: () {}, text: 'Sign up '),

            const SizedBox(height: 30),

            //buttun for switch between pages
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
