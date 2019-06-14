import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: new SingleChildScrollView(
        child: LoginScreen2(
          backgroundColor1: Color(0xFF444152),
          backgroundColor2: Color(0xFF6f6c7d),
          highlightColor: Color(0xfff65aa3),
          foregroundColor: Colors.white,
          logo: new AssetImage("assets/images/full-bloom.png"),
        ),
      ),
    );
  }
}
