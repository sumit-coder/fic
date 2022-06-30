import 'package:flutter/material.dart';

import '../../../constants/ui_constants.dart';
import 'apple_sign_in_button.dart';
import 'facebook_sign_in_button.dart';
import 'google_sign_in_button.dart';

class SocialSignInButtons extends StatelessWidget {
  const SocialSignInButtons(
      {Key? key,
      required this.onTapGoogleButton,
      required this.onTapAppleButton,
      required this.onTapFacebookButton})
      : super(key: key);

  final VoidCallback onTapGoogleButton;
  final VoidCallback onTapAppleButton;
  final VoidCallback onTapFacebookButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Text(
            'or connect with',
            style: TextStyle(
              color: textFocusColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleSignUpButton(
                onTap: () {},
              ),
              AppleSignInButton(
                onTap: () {},
              ),
              FacebookSignUpButton(
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
