import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign In as',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Text(user.email.toString()),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}
