import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:jobfinder/screens/forgot_password.dart';
import 'package:provider/src/provider.dart';
import '../widgets/signin_error_dialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff915fb5),
              Color(0xffca436b),
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  logoText(),
                  devider(10),
                  emailInput(context),
                  devider(10),
                  passwordInput(context),
                  devider(10),
                  loginButton(context),
                  devider(10),
                  orText(),
                  devider(10),
                  enterpriseLoginButton(context),
                  devider(5),
                  newAccountButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container logoText() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        'JobFinder',
        style: GoogleFonts.lobster(
          textStyle: const TextStyle(
            color: Color(0xffffffff),
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  SizedBox newAccountButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Create new account'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(255, 0, 255, 0.1),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(15),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox enterpriseLoginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Enterprise login'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(255, 105, 180, 0.2),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(15),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox passwordInput(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          filled: true,
          fillColor: const Color.fromRGBO(
            255,
            255,
            255,
            0.1,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  SizedBox emailInput(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Email address',
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          filled: true,
          fillColor: const Color.fromRGBO(
            255,
            255,
            255,
            0.1,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  SizedBox devider(double hegiht) {
    return SizedBox(
      height: hegiht,
    );
  }

  Text orText() {
    return const Text(
      'Or',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }

  SizedBox loginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await context.read<AuthProvider>().signInWithEmailAndPassword(
                      _emailController.text, _passwordController.text);
                  FocusScope.of(context).unfocus();
                } on FirebaseAuthException catch (e) {
                  showError(context, 'Error', e.message!);
                }
              },
              child: const Text('Login'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(255, 255, 255, 0),
                ),
                elevation: MaterialStateProperty.all<double>(0),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(15),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ForgotPassword(),
                ),
              );
            },
            child: const Text(
              'Forgot password',
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(15),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
