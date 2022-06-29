import 'dart:ffi';

import 'package:fic/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TypeOfOtpError { emptyOtp, wrongOtp, none }

class OtpTextFields extends StatefulWidget {
  const OtpTextFields({
    Key? key,
    required this.onChange(List<int> asdf),
    required this.otpError,
  }) : super(key: key);

  final Function onChange;
  final TypeOfOtpError otpError;

  @override
  State<OtpTextFields> createState() => _OtpTextFieldsState();
}

class _OtpTextFieldsState extends State<OtpTextFields> {
  late FocusNode myFocusNode;
  late FocusNode myFocusNode2;
  late FocusNode myFocusNode3;
  late FocusNode myFocusNode4;

  List<int> otpValues = [0, 0, 0, 0];

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    myFocusNode2 = FocusNode();
    myFocusNode3 = FocusNode();
    myFocusNode4 = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    myFocusNode2.dispose();
    myFocusNode3.dispose();
    myFocusNode4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 45,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OtpTextField(
                isError: widget.otpError != TypeOfOtpError.none ? true : false,
                myFocusNodeA: myFocusNode,
                onChange: (value) {
                  if (value != '') {
                    setState(() {
                      otpValues[0] = int.parse(value);
                    });
                  } else {
                    setState(() {
                      otpValues[0] = 0;
                    });
                  }
                  widget.onChange(otpValues);
                  //
                  if (value == '') {
                    // myFocusNode.requestFocus();
                  } else {
                    myFocusNode2.requestFocus();
                  }
                },
              ),
              const SizedBox(width: 6),
              OtpTextField(
                isError: widget.otpError != TypeOfOtpError.none ? true : false,
                myFocusNodeA: myFocusNode2,
                onChange: (value) {
                  if (value != '') {
                    setState(() {
                      otpValues[1] = int.parse(value);
                    });
                  } else {
                    setState(() {
                      otpValues[1] = 0;
                    });
                  }
                  widget.onChange(otpValues);
                  //
                  if (value == '') {
                    myFocusNode.requestFocus();
                  } else {
                    myFocusNode3.requestFocus();
                  }
                },
              ),
              const SizedBox(width: 6),
              OtpTextField(
                isError: widget.otpError != TypeOfOtpError.none ? true : false,
                myFocusNodeA: myFocusNode3,
                onChange: (value) {
                  if (value != '') {
                    setState(() {
                      otpValues[2] = int.parse(value);
                    });
                  } else {
                    setState(() {
                      otpValues[2] = 0;
                    });
                  }

                  widget.onChange(otpValues);
                  //
                  if (value == '') {
                    myFocusNode2.requestFocus();
                  } else {
                    myFocusNode4.requestFocus();
                  }
                },
              ),
              const SizedBox(width: 6),
              OtpTextField(
                isError: widget.otpError != TypeOfOtpError.none ? true : false,
                myFocusNodeA: myFocusNode4,
                onChange: (value) {
                  if (value != '') {
                    setState(() {
                      otpValues[3] = int.parse(value);
                    });
                  } else {
                    setState(() {
                      otpValues[3] = 0;
                    });
                  }
                  widget.onChange(otpValues);
                  //
                  if (value == '') {
                    myFocusNode3.requestFocus();
                  } else if (value != '') {
                    myFocusNode4.unfocus();
                  }
                },
              ),
            ],
          ),
          widget.otpError == TypeOfOtpError.wrongOtp
              ? Container(
                  height: 30,
                  padding: EdgeInsets.only(top: 10),
                  child: const Text(
                    'OTP incorrect',
                    style: TextStyle(
                      fontSize: 14,
                      color: errorTextColor,
                    ),
                  ),
                )
              : widget.otpError == TypeOfOtpError.emptyOtp
                  ? Container(
                      height: 30,
                      padding: EdgeInsets.only(top: 10),
                      child: const Text(
                        'Type OTP',
                        style: TextStyle(
                          fontSize: 14,
                          color: errorTextColor,
                        ),
                      ),
                    )
                  : const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    Key? key,
    required this.myFocusNodeA,
    required this.onChange,
    required this.isError,
  }) : super(key: key);

  final FocusNode myFocusNodeA;
  final Function onChange;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 44,
      // padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: isError == true ? errorTextColor : Colors.white,
        ),
      ),
      child: Center(
        child: TextField(
          maxLength: 1,
          focusNode: myFocusNodeA,
          style: const TextStyle(fontSize: 16),
          keyboardType: TextInputType.phone,
          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
            label: Center(
              child: Text("0"),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          onChanged: (value) {
            onChange(value);
          },
        ),
      ),
    );
  }
}
