import 'package:flutter/material.dart';

import '../../../constants/ui_constants.dart';

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
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
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
