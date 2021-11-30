import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/provider/auth.dart';
import 'package:jobfinder/screens/home.dart';
import 'package:provider/src/provider.dart';

import 'screens/signin.dart';

class AuthState extends StatelessWidget {
  const AuthState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<AuthProvider>().user,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return Home();
        }
        return Home();
      },
    );
  }
}
