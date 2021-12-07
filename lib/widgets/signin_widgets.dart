import 'package:flutter/material.dart';

buttons({required String text, required Function event}) {
  return ElevatedButton(
    onPressed: () {
      event();
    },
    child: Text(text),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0xff333333),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.all(15),
      ),
    ),
  );
}

appbar() {
  return AppBar(
    title: const Text(
      'Sign in to your account',
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
