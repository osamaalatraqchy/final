import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:jobfinder/screens/signin.dart';
import 'package:jobfinder/widgets/home_widgets.dart';
import 'package:provider/src/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black87,
        child: Column(
          children: [
            spacer(),
            title('JobFinder'),
            const SizedBox(
              height: 10,
            ),
            description(
                'The platform for finding the avilable jobs based on your local area.'),
            spacer(),
            loginButton(context, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignIn(),
                ),
              );
            }),
            googleSignIn(context, () async {
              try {
                final user =
                    await context.read<AuthProvider>().googleSignInProvider();
                print(user);
              } on FirebaseAuthException catch (e) {
                print(e);
              } on PlatformException catch (e) {
                print(e);
              }
            }),
            newAccountBUtton(context),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
