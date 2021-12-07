import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:jobfinder/screens/forgot_password.dart';
import 'package:jobfinder/widgets/error_dialog.dart';
import 'package:jobfinder/widgets/signin_widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Create a new account',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.black87),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !EmailValidator.validate(value)) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0xff2d2d2d),
                          hintText: 'Email address',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Password must be at least 6 charcters.';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0xff2d2d2d),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: buttons(
                                  text: 'Sign up',
                                  event: () async {
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        final userCred = await context
                                            .read<AuthProvider>()
                                            .createUserWithEmailAndPassword(
                                              _emailController.text,
                                              _passwordController.text,
                                            );
                                        await userCred!.user!
                                            .sendEmailVerification();
                                        ScaffoldMessenger.of(context)
                                            .showMaterialBanner(
                                          MaterialBanner(
                                              content: const Text(
                                                  'Email verification has been sent.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearMaterialBanners();
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ]),
                                        );
                                      } on FirebaseAuthException catch (e) {
                                        showError(context, 'Error ${e.code}',
                                            e.message!);
                                      }
                                    }
                                  }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: buttons(
                                  text: 'Already have an account',
                                  event: () {
                                    FocusScope.of(context).unfocus();
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const SignIn(),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
