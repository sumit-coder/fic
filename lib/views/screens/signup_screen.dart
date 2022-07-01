import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../../enums/enums.dart';
import '../../utility/email_password_validation.dart';
import '../animations/bear_animation_widget.dart';
import '../widgets/buttons/social_sign_in_buttons.dart';
import '../widgets/form_widgets/email_input_field.dart';
import '../widgets/form_widgets/form_submit_button.dart';
import '../widgets/form_widgets/password_input_field.dart';
import 'fake_dashboard_screen.dart';
import 'forget_password_screen.dart';
import 'multi_use_screens/otp_verification_screen.dart';
import 'multi_use_screens/setup_password_screen.dart';
import 'signin_screen.dart';

class SignUpScreenScreen extends StatefulWidget {
  const SignUpScreenScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreenScreen> createState() => _SignUpScreenScreenState();
}

class _SignUpScreenScreenState extends State<SignUpScreenScreen> {
  String typedEmail = '';

  TypeOfEmailError emailError = TypeOfEmailError.none;

  onTapContinue() {
    // Email Validation
    if (typedEmail != '') {
      if (isEmailValid(typedEmail) == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationScreen(
              userEmail: typedEmail,
            ),
          ),
        );
      } else {
        setState(() {
          emailError = TypeOfEmailError.inValidEmail;
        });
      }
    } else {
      setState(() {
        emailError = TypeOfEmailError.emailFieldIsEmpty;
      });
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
                    'Sign up',
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xFF21005D),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // send to other scrren if Don't have an account? or allready have an account?
                SendToOtherScreenWithInfoText(
                  firstInfoText: "Already have an account?",
                  textButtonText: 'Sign in',
                  onTapTextButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreenScreen(),
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
                        isDisable: false,
                        hintText: 'parent@gmail.com',
                        errorText: 'This is error Message',
                        titleText: 'Parent Email*',
                        isError: emailError,
                        onValueChange: (typedValue) {
                          setState(() {
                            emailError = TypeOfEmailError.none;
                            typedEmail = typedValue;
                          });
                        },
                      ),

                      const SizedBox(height: 24),
                      // submit button and forgot password button
                      Align(
                        alignment: Alignment.topCenter,
                        child: FormSubmitButton(
                          onTap: () {
                            onTapContinue();
                          },
                          buttonTitle: 'Continue',
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
