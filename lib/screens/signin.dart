import 'package:flutter/material.dart';
import 'package:jobfinder/widgets/signin_widgets.dart';

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
                                  event: () {
                                    print('Sin in button');
                                  }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: buttons(
                                  text: 'Forgot password',
                                  event: () {
                                    print('Forgot button');
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
