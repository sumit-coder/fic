import 'package:fic/views/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../widgets/form_widgets/email_input_field.dart';
import '../widgets/form_widgets/form_submit_button.dart';
import '../widgets/form_widgets/password_input_field.dart';

class SingUpScreenScreen extends StatelessWidget {
  const SingUpScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  margin: const EdgeInsets.only(left: 28, right: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 36,
                          color: Color(0xFF21005D),
                        ),
                      ),
                      Text(
                        'Sign up to dig depper in your roots!',
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
                        errorText: 'Passwords don’t match.',
                        titleText: 'Create Password',
                        isError: false,
                        needPasswordInstruction: true,
                        onValueChange: (typedValue) {},
                      ),

                      // Re-enter Password Field
                      const SizedBox(height: 20),
                      PasswordInputField(
                        hintText: 'Enter your password',
                        errorText: 'Passwords don’t match.',
                        titleText: 'Re-enter Password*',
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
                          buttonTitle: 'Sign Up',
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Go to Sign in Screen Text Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Color(0xFF79747E),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(65, 20),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignInScreenScreen()),
                              );
                            },
                            child: const Text(
                              'Sign in ->',
                              style: TextStyle(
                                color: textFocusColor,
                              ),
                            ),
                          )
                        ],
                      )
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
