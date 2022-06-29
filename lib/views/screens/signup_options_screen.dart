import 'package:fic/constants/ui_constants.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons/email_sign_in_button.dart';
import '../widgets/buttons/facebook_sign_in_button.dart';
import '../widgets/buttons/google_sign_in_button.dart';
import 'signin_screen.dart';
import 'signup_screen.dart';

class SignUpOptionsScreen extends StatelessWidget {
  const SignUpOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 296,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 36,
                        color: Color(0xFF21005D),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Let’s dig deeper in your roots!',
                      style: TextStyle(
                        fontSize: 16,
                        color: nonActiveTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 94),
              FacebookSignUpButton(
                onTap: () {},
              ),
              const SizedBox(height: 24),
              GoogleSignUpButton(
                onTap: () {},
              ),
              const SizedBox(height: 32),
              const Text(
                'OR',
                style:
                    TextStyle(fontSize: 16, color: Color(0xFF21005D), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              SignUpWithEmailButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SingUpScreenScreen()),
                  );
                },
              ),
              const SizedBox(height: 32),
              // Already have an account and sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: nonActiveTextColor,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(70, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreenScreen()),
                      );
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Sign in',
                          style: TextStyle(color: textFocusColor, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: textFocusColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 92),
            ],
          ),
        ),
      ),
    );
  }
}
