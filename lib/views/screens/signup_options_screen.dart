import 'package:fic/constants/ui_constants.dart';
import 'package:flutter/material.dart';

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

class FacebookSignUpButton extends StatelessWidget {
  const FacebookSignUpButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: facebookSignUpButtonColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: 44,
          width: 296,
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Row(
            children: [
              Image.asset(
                'assets/images/facebook_icon.png',
                scale: 28,
              ),
              const SizedBox(width: 8),
              const Text(
                'Continue with Facebook',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignUpButton extends StatelessWidget {
  const GoogleSignUpButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: 44,
          width: 296,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: googleSignUpButtonBorderColor,
            ),
          ),
          child: Row(
            children: const [
              Icon(
                Icons.golf_course,
                color: Colors.green,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Continue with Google',
                style: TextStyle(
                  fontSize: 16,
                  color: nonActiveTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpWithEmailButton extends StatelessWidget {
  const SignUpWithEmailButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: emailSignUpButtonColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: 44,
          width: 296,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(),
          child: Row(
            children: const [
              Icon(
                Icons.email_outlined,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Sign up with Email',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
