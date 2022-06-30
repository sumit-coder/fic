import 'package:flutter/material.dart';

import 'views/screens/fake_dashboard_screen.dart';
import 'views/screens/forget_password_screen.dart';
import 'views/screens/multi_use_screens/otp_verification_screen.dart';
import 'views/screens/signin_screen.dart';
import 'views/screens/multi_use_screens/setup_password_screen.dart';
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
      initialRoute: '/sign_in_screen',
      routes: {
        '/sign_in_screen': (context) => const SignInScreenScreen(),
        '/sign_in_screen2': (context) => const SignUpScreenScreen(),
        '/sign_in_screen1': (context) => const FakeDashboardScreen(),
      },
      home: const SignInScreenScreen(),
    );
  }
}
