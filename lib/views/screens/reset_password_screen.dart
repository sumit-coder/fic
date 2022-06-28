import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../widgets/form_widgets/email_input_field.dart';
import '../widgets/form_widgets/form_submit_button.dart';
import '../widgets/form_widgets/password_input_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  margin: const EdgeInsets.only(left: 28, right: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Reset password',
                        style: TextStyle(
                          fontSize: 36,
                          color: Color(0xFF21005D),
                        ),
                      ),
                      Text(
                        'Don’t worry, it happens to the best of us.',
                        style: TextStyle(color: Color(0xFF79747E)),
                      ),
                    ],
                  ),
                ),

                // Sign Up Form Card
                Container(
                  padding: const EdgeInsets.all(28),
                  margin: const EdgeInsets.all(28),
                  constraints: const BoxConstraints(maxWidth: 352),
                  decoration: BoxDecoration(
                    color: inputFormBackgroudColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field

                      EmailInputField(
                        hintText: 'parent@gmail.com',
                        errorText: 'This is error Message',
                        titleText: 'Parent Email',
                        isError: false,
                        onValueChange: (typedValue) {},
                      ),
                      // Password Field
                      const SizedBox(height: 20),

                      PasswordInputField(
                        hintText: 'Enter your password',
                        errorText: 'This is error Message',
                        titleText: 'Create New Password*',
                        isError: false,
                        needPasswordInstruction: true,
                        onValueChange: (typedValue) {},
                      ),

                      // Re-enter Password Field
                      const SizedBox(height: 20),

                      PasswordInputField(
                        hintText: 'Enter your password',
                        errorText: 'Passwords don’t match.',
                        titleText: 'Re-enter New Password*',
                        isError: false,
                        needPasswordInstruction: false,
                        onValueChange: (typedValue) {},
                      ),
                      const SizedBox(height: 24),
                      // Sign Up Button
                      Align(
                        alignment: Alignment.topCenter,
                        child: FormSubmitButton(
                          onTap: () {},
                          buttonTitle: 'Continue',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Password must include at least:
// A minimum of 8 characters
// One uppercase (A-Z) 
// One lowercase letters (a-z)
// One number (0-9)