import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_auth/auth.dart';
import 'package:flutter_firebase_auth/home.dart';
import 'package:flutter_firebase_auth/login.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('something Went Wrong!'),
          );
        }
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return AuthPage();
        }
      },
    ));
  }
}
