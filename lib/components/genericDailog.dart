import 'package:flutter/material.dart';

typedef Optiontitle<T> = Map<String, T> Function();

Future<T?> genericDailog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required Optiontitle optiontitle,
}) {
  final option = optiontitle();
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: option.keys.map((optiontitle) {
          final T value = option[optiontitle];
          return TextButton(
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(optiontitle),
          );
        }).toList(),
      );
    },
  );
}
