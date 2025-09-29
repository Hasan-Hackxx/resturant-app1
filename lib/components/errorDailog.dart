import 'package:flutter/material.dart';
import 'package:resturant_app1/components/genericDailog.dart';

Future<void> errorDailog(BuildContext context, String content) {
  return genericDailog(
    context: context,
    title: 'Error',
    content: content,
    optiontitle: () => {'ok': null},
  );
}
