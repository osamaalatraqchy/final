import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

spacer() {
  return const Spacer(
    flex: 2,
  );
}

title(String title) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    ),
  );
}

description(String description) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, height: 1.5),
      ),
    ),
  );
}

loginButton(BuildContext context, Function event) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          event();
        },
        child: const Text('Sign in'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black12),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(15),
          ),
        ),
      ),
    ),
  );
}

googleSignIn(BuildContext context, Function event) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          event();
        },
        icon: const Icon(Icons.g_mobiledata),
        label: const Text('Continue with Google'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.redAccent),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(10),
          ),
        ),
      ),
    ),
  );
}

newAccountBUtton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Create new account'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black12),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(15),
          ),
        ),
      ),
    ),
  );
}
