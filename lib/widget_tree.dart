import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/pages/BaseLayout.dart';
import 'package:fitness/pages/auth/auth.dart';
import 'package:fitness/pages/auth/login.dart';
import 'package:fitness/pages/home.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  HomePage();
        } else {
          return const Login();
        }
      },
    );
  }
}
