import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../animations/bear_animation_widget.dart';
import '../widgets/form_widgets/email_input_field.dart';
import '../widgets/form_widgets/form_submit_button.dart';
import '../widgets/form_widgets/password_input_field.dart';
import 'fake_dashboard_screen.dart';
import 'forget_password_screen.dart';
import 'signup_options_screen.dart';

class SignInScreenScreen extends StatefulWidget {
  const SignInScreenScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreenScreen> createState() => _SignInScreenScreenState();
}

class _SignInScreenScreenState extends State<SignInScreenScreen> {
  String rightEmail = 'fic@gmail.com';
  String rightPassword = '12345678';

  String typedEmail = '';
  String typedPassword = '';
  bool isRememberMe = false;

  bool isEmailError = false;
  bool isPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFF21005D),
                    ),
                  ),
                ),
                const BearAnimationWidget(),
                // Sign Up Form Card
                Container(
                  padding: const EdgeInsets.all(28),
                  margin: const EdgeInsets.only(left: 28, right: 28),
                  constraints: const BoxConstraints(maxWidth: 352),
                  decoration: BoxDecoration(
                    color: inputFormBackgroudColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field
                      const SizedBox(height: 6),
                      EmailInputField(
                        isDisable: true,
                        hintText: 'Enter Email',
                        errorText: 'This is error Message',
                        titleText: 'Email',
                        isError: isEmailError,
                        onValueChange: (typedValue) {
                          setState(() {
                            isEmailError = false;
                            typedEmail = typedValue;
                          });
                        },
                      ),
                      // Password Field
                      const SizedBox(height: 20),

                      // Enter Password Field
                      PasswordInputField(
                        hintText: 'Enter your password',
                        errorText: 'Please enter the correct password.',
                        titleText: 'Enter Password*',
                        isError: isPasswordError,
                        needPasswordInstruction: false,
                        onValueChange: (typedValue) {
                          setState(() {
                            isPasswordError = false;
                            typedPassword = typedValue;
                          });
                        },
                      ),

                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 18,
                            width: 18,
                            child: Checkbox(
                              value: isRememberMe,
                              checkColor: Colors.white,
                              activeColor: nonActiveTextColor,
                              onChanged: (value) {
                                setState(() {
                                  isRememberMe = !isRememberMe;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              color: nonActiveTextColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // submit button and forgot password button
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            // Sign Up Button
                            FormSubmitButton(
                              onTap: () {
                                if (typedEmail != '' && typedPassword != '') {
                                  if (typedEmail == rightEmail && typedPassword == rightPassword) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const FakeDashboardScreen(),
                                      ),
                                    );
                                  } else {
                                    if (typedEmail != rightEmail) {
                                      setState(() {
                                        isEmailError = true;
                                      });
                                    }
                                    if (typedPassword != rightPassword) {
                                      setState(() {
                                        isPasswordError = true;
                                      });
                                    }
                                  }
                                }
                              },
                              buttonTitle: 'Sign In',
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(70, 20),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ForgetPasswordScreen()),
                                );
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: textFocusColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Go to Sign in Screen Text Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
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
                                MaterialPageRoute(
                                  builder: (context) => const SignUpOptionsScreen(),
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: textFocusColor,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 14,
                                  color: textFocusColor,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
