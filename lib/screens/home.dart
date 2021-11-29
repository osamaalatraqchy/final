import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:jobfinder/screens/login.dart';
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
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'JobFinder',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'The platform for finding the avilable jobs based on your local area.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, height: 1.5),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SignIn(),
                      ),
                    );
                  },
                  child: Text('Login'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      final user = await context
                          .read<AuthProvider>()
                          .googleSignInProvider();
                      print(user);
                    } on FirebaseAuthException catch (e) {
                      print(e);
                    } on PlatformException catch (e) {
                      print(e);
                    }
                  },
                  icon: Icon(Icons.g_mobiledata),
                  label: Text('Continue with Google'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Create new account'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
