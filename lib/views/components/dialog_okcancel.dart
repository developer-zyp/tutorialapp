import 'package:flutter/material.dart';

showOkCancelDialog(BuildContext context) {
  return AlertDialog(
    title: Text('Confirmation'),
    content: Text('Are you sure you want to proceed?'),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(false);
        },
        child: Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(true);
        },
        child: Text('OK'),
      ),
    ],
  );
}
