import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:jobfinder/widgets/error_dialog.dart';
import 'package:jobfinder/widgets/signin_widgets.dart';
import 'package:provider/src/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Reset your password'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff2d2d2d),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Center(
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
                      if (value!.isEmpty || !EmailValidator.validate(value)) {
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
                  child: SizedBox(
                    width: double.infinity,
                    child: buttons(
                        text: 'Send link',
                        event: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              await context
                                  .read<AuthProvider>()
                                  .sendForgotPasswordLink(
                                      _emailController.text);
                            } on FirebaseAuthException catch (e) {
                              showError(context, 'Error ${e.code}', e.message!);
                            }
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
