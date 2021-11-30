import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:jobfinder/screens/forgot_password.dart';
import 'package:jobfinder/widgets/error_dialog.dart';
import 'package:jobfinder/widgets/signin_widgets.dart';
import 'package:provider/src/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appbar(),
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
                    textFields(
                        controller: _emailController,
                        hintText: 'Email address',
                        secureText: false),
                    textFields(
                        controller: _passwordController,
                        hintText: 'Password',
                        secureText: true),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: buttons(
                                  text: 'Sign in',
                                  event: () async {
                                    try {
                                      await context
                                          .read<AuthProvider>()
                                          .signInWithEmailAndPassword(
                                              _emailController.text,
                                              _passwordController.text);
                                    } on FirebaseAuthException catch (e) {
                                      showError(context, 'Error ${e.code}',
                                          e.message!);
                                    }
                                  }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: buttons(
                                  text: 'Forgot password',
                                  event: () {
                                    FocusScope.of(context).unfocus();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ForgotPassword(),
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
