import 'package:flutter/material.dart';

import '../../../constants/ui_constants.dart';

class FormSubmitButton extends StatelessWidget {
  const FormSubmitButton({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
  }) : super(key: key);

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 197,
      child: Material(
        color: buttonActiveColor,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Center(
            child: Text(
              buttonTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
