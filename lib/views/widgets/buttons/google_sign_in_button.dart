import 'package:flutter/material.dart';

import '../../../constants/ui_constants.dart';

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
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          height: 44,
          width: 296,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              width: 1,
              color: googleSignUpButtonBorderColor,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/google_icon.png',
                scale: 34,
              ),
              const SizedBox(width: 8),
              const Text(
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
