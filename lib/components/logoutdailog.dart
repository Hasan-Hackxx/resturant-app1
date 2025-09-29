import 'package:flutter/material.dart';
import 'package:resturant_app1/components/genericDailog.dart';

Future<bool> logoutDailog(BuildContext context) {
  return genericDailog(
    context: context,
    title: 'logout',
    content: 'Are you sure you want to logout ',
    optiontitle: () => {'Yes': true, 'No': false},
  ).then((value) => value ?? false);
}
