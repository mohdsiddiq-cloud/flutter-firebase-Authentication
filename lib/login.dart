import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/register.dart';
import 'package:flutter_firebase_auth/utils.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage(this.onClickedSignUp);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnacker(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) =>
                  value != null && !EmailValidator.validate(value)
                      ? 'Enter a valid email'
                      : null,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(hintText: 'Password'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Enter min 6 characters'
                  : null,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: login, child: Text('Sign In')),
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: 'No account? ',
                    children: [
                  TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up')
                ]))
          ],
        ),
      ),
    );
  }
}
