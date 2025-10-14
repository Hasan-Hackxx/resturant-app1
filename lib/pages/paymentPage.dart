import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:resturant_app1/components/myButton.dart';
import 'package:resturant_app1/pages/deliveryPage.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvfocesed = false;

  void userTapped() {
    if (formKey.currentState!.validate()) {
      // only show dailog if its valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirm Payment..!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number : $cardNumber'),
                Text('Expire Date : $expiryDate'),
                Text('Card Holder name  : $cardHolderName'),
                Text('Cvv : $cvvCode'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Deliverypage()),
                );
              },
              child: Text('Yes'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Checkout'),
        backgroundColor: const Color.fromARGB(255, 185, 185, 185),
      ),
      body: Column(
        children: [
          //credit cart
          /* CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvfocesed,
            onCreditCardWidgetChange: (p0) {},
          ),*/

          // card form
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),
          //button
          Spacer(),
          Mybutton(onTap: userTapped, text: 'Pay Now'),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
