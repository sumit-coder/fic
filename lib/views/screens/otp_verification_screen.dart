import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../widgets/form_widgets/form_submit_button.dart';
import '../widgets/form_widgets/otp_text_field.dart';
import 'reset_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TypeOfOtpError otpError = TypeOfOtpError.none;
  int otpValue = 0000;

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
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    width: 296,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'OTP Verification',
                          style: TextStyle(
                            fontSize: 36,
                            color: Color(0xFF21005D),
                          ),
                        ),
                        Text(
                          'We have sent you a one time password on your registered email.',
                          style: TextStyle(
                            fontSize: 16,
                            color: nonActiveTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                      const SizedBox(height: 24),
                      // OTP text Fields
                      OtpTextFields(
                        otpError: otpError,
                        onChange: (List<int> value) {
                          setState(() {
                            otpValue = int.parse('${value[0]}${value[1]}${value[2]}${value[3]}');
                            otpError = TypeOfOtpError.none;
                          });
                        },
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const SignUpOptionsScreen(),
                              //   ),
                              // );
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Resend',
                                  style: TextStyle(
                                    color: textFocusColor,
                                  ),
                                ),
                                Icon(
                                  Icons.cached,
                                  size: 14,
                                  color: textFocusColor,
                                )
                              ],
                            ),
                          )
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
                                if (otpValue == 0000 || otpValue == null) {
                                  setState(() {
                                    otpError = TypeOfOtpError.emptyOtp;
                                  });
                                } else if (otpValue != 1234) {
                                  setState(() {
                                    otpError = TypeOfOtpError.wrongOtp;
                                  });
                                } else {
                                  setState(() {
                                    otpError = TypeOfOtpError.none;
                                  });
                                  print('----OTP IS RIGHT----');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ResetPasswordScreen(),
                                    ),
                                  );
                                }
                              },
                              buttonTitle: 'Continue',
                            ),
                          ],
                        ),
                      ),
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
