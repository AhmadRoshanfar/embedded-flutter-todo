import 'package:flutter/material.dart';

void showInfoSnackbar(BuildContext context, String message) {
  var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: const Color.fromARGB(255, 27, 107, 29),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.amber,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showErrorSnackbar(BuildContext context, String message) {
  var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
