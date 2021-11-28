import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:provider/src/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset your password'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade600,
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter email addrress',
                style: GoogleFonts.lato(),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await context
                        .read<AuthProvider>()
                        .sendForgotPasswordLink(_emailController.text);
                    Navigator.pop(context);
                  } on FirebaseAuthException catch (e) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: SingleChildScrollView(
                              child: Text(e.message!),
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
                },
                child: const Text('Send link'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
