import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../../enums/enums.dart';
import '../animations/bear_animation_widget.dart';
import '../widgets/buttons/social_sign_in_buttons.dart';
import '../widgets/form_widgets/email_input_field.dart';
import '../widgets/form_widgets/form_submit_button.dart';
import '../widgets/form_widgets/password_input_field.dart';
import 'fake_dashboard_screen.dart';
import 'forget_password_screen.dart';
import 'multi_use_screens/setup_password_screen.dart';
import 'signup_screen.dart';

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

  TypeOfEmailError emailError = TypeOfEmailError.none;

  TypeOfPasswordError passwordError = TypeOfPasswordError.none;

  onPressedSignButton() {
    // if Email and Password is NOT EMPTY
    if (typedEmail != '' && typedPassword != '') {
      // if Email and Password Right
      if (typedEmail == rightEmail && typedPassword == rightPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FakeDashboardScreen(),
          ),
        );
      } else {
        // if Email and Password Not Right
        if (typedEmail != rightEmail) {
          setState(() {
            setState(() {
              emailError = TypeOfEmailError.wrongEmail;
            });
          });
        }
        if (typedPassword != rightPassword) {
          setState(() {
            passwordError = TypeOfPasswordError.wrongPassword;
          });
        }
      }
    }
    // Email and Password is Empty
    if (typedEmail == '' && typedPassword == '') {
      setState(() {
        emailError = TypeOfEmailError.emailFieldIsEmpty;
        passwordError = TypeOfPasswordError.passwordFieldIsEmpty;
      });

      return;
    }
    // Email is Empty
    if (typedEmail == '') {
      setState(() {
        emailError = TypeOfEmailError.emailFieldIsEmpty;
      });

      return;
    }
    // Password is Empty
    if (typedPassword == '') {
      setState(() {
        passwordError = TypeOfPasswordError.passwordFieldIsEmpty;
      });

      return;
    }
  }

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
                // send to other scrren if Don't have an account? or allready have an account?
                SendToOtherScreenWithInfoText(
                  firstInfoText: "Don't have an account? ",
                  textButtonText: 'Sign up',
                  onTapTextButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreenScreen(),
                      ),
                    );
                  },
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
                      EmailInputField(
                        isDisable: true,
                        hintText: 'Email',
                        errorText: 'This is error Message',
                        titleText: 'Email',
                        isError: emailError,
                        onValueChange: (typedValue) {
                          setState(() {
                            typedEmail = typedValue;
                          });
                        },
                      ),
                      // Password Field
                      const SizedBox(height: 16),

                      // Enter Password Field
                      PasswordInputField(
                        hintText: 'Password',
                        errorText: 'Please enter the correct password.',
                        titleText: 'Enter Password*',
                        isError: passwordError,
                        needPasswordInstruction: false,
                        onValueChange: (typedValue) {
                          setState(() {
                            typedPassword = typedValue;
                          });
                        },
                      ),

                      const SizedBox(height: 16),
                      // Remember and forgot passoword TEXT BUTTONS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          // Forgot Password Button
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
                              'Forgot password',
                              style: TextStyle(
                                color: nonActiveTextColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      // submit button and forgot password button
                      Align(
                        alignment: Alignment.topCenter,
                        child: FormSubmitButton(
                          onTap: () {
                            onPressedSignButton();
                          },
                          buttonTitle: 'Sign In',
                        ),
                      ),
                    ],
                  ),
                ),
                SocialSignInButtons(
                  onTapGoogleButton: () {},
                  onTapAppleButton: () {},
                  onTapFacebookButton: () {},
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

class SendToOtherScreenWithInfoText extends StatelessWidget {
  const SendToOtherScreenWithInfoText({
    Key? key,
    required this.onTapTextButton,
    required this.firstInfoText,
    required this.textButtonText,
  }) : super(key: key);

  final VoidCallback onTapTextButton;
  final String firstInfoText;
  final String textButtonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstInfoText,
          style: const TextStyle(
            color: nonActiveTextColor,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(70, 20),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onTapTextButton,
          child: Row(
            children: [
              Text(
                textButtonText,
                style: const TextStyle(
                  color: textFocusColor,
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                size: 14,
                color: textFocusColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
