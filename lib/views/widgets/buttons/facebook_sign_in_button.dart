import 'package:flutter/material.dart';

import '../../../constants/ui_constants.dart';

class FacebookSignUpButton extends StatelessWidget {
  const FacebookSignUpButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(24),
      color: facebookSignUpButtonColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
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
