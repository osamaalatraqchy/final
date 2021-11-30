import 'package:flutter/material.dart';

void showError(BuildContext context, String title, String error) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xffeeeeee),
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(
              error,
              style: const TextStyle(height: 1.5),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      });
}
