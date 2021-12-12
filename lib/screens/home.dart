import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:jobfinder/provider/permission.dart';
import 'package:jobfinder/screens/signin.dart';
import 'package:jobfinder/screens/signup.dart';
import 'package:jobfinder/widgets/error_dialog.dart';
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
      body: FutureBuilder(
        future: context.read<PermissionAsk>().determinePosition(),
        builder: (context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black87,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }

          if (snapshot.hasError) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black87,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Text(
                        snapshot.error.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          height: 1.5,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Geolocator.openLocationSettings();
                        },
                        child: const Text('Open location sesstings'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          print(snapshot);
          return Container(
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
                    await context.read<AuthProvider>().googleSignInProvider();
                  } on FirebaseAuthException catch (e) {
                    showError(context, e.code, e.message!);
                  } on PlatformException catch (e) {
                    showError(context, e.code, e.message!);
                  }
                }),
                newAccountButton(
                    context: context,
                    event: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignUp()),
                      );
                    }),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
