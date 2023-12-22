// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sample/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotohome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
    );
  }
}

gotohome(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));
  Navigator.push(
      context, MaterialPageRoute(builder: (ctx) => const SigninScreen()));
}
