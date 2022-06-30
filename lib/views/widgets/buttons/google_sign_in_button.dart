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
      // color: emailSignUpButtonColor,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(),
          child: Center(
            child: SizedBox(
              height: 36,
              width: 36,
              child: Image.asset(
                'assets/images/google_icon.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
