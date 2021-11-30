import 'package:flutter/material.dart';

textFields(
    {required TextEditingController controller,
    required String hintText,
    required bool secureText}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      obscureText: secureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: const Color(0xff2d2d2d),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.5),
        ),
      ),
      style: const TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.5),
      ),
    ),
  );
}

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
