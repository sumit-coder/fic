import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../../enums/enums.dart';
import '../../utility/email_password_validation.dart';
import '../animations/bear_animation_widget.dart';
import '../widgets/form_widgets/email_input_field.dart';
import '../widgets/form_widgets/form_submit_button.dart';
import 'multi_use_screens/otp_verification_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
                Container(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  margin: const EdgeInsets.only(left: 28, right: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Forgot password',
                        style: TextStyle(
                          fontSize: 36,
                          color: Color(0xFF21005D),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Don’t worry, it happens to the best of us.',
                        style: TextStyle(color: Color(0xFF79747E)),
                      ),
                    ],
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

                      EmailInputField(
                        isDisable: false,
                        hintText: 'Email',
                        errorText: 'This is error Message',
                        titleText: 'Parent Email*',
                        isError: TypeOfEmailError.none,
                        onValueChange: (typedValue) {
                          setState(() {
                            typedEmail = typedValue;
                          });
                        },
                      ),

                      const SizedBox(height: 24),
                      // Sign Up Button
                      Align(
                        alignment: Alignment.topCenter,
                        child: FormSubmitButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpVerificationScreen(
                                  userEmail: typedEmail,
                                ),
                              ),
                            );
                          },
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
