import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_auth/login.dart';
import 'package:flutter_firebase_auth/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return isLogin ? LoginPage(toggle) : SignUp(toggle);
  }

  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }
}
