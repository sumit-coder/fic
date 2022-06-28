import 'package:flutter/material.dart';

import 'views/screens/fake_dashboard_screen.dart';
import 'views/screens/forget_password_screen.dart';
import 'views/screens/reset_password_screen.dart';
import 'views/screens/signin_screen.dart';
import 'views/screens/signup_options_screen.dart';
import 'views/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FIC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreenScreen(),
    );
  }
}
