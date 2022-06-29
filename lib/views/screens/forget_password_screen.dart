import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../animations/bear_animation_widget.dart';
import '../widgets/form_widgets/email_input_field.dart';
import '../widgets/form_widgets/form_submit_button.dart';
import 'otp_verification_screen.dart';
import 'reset_password_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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
                        hintText: 'Email',
                        errorText: 'This is error Message',
                        titleText: 'Parent Email*',
                        isError: false,
                        onValueChange: (typedValue) {},
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
                                  builder: (context) => const OtpVerificationScreen()),
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
