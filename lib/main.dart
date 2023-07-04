import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/pages/auth/login.dart';
import 'package:fitness/widget_tree.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const WidgetTree(),
            initialRoute: '/',
                  routes: {
        '/login': (context) => Login(), // Login route
      },
    );
  }
}

