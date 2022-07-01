import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constants/ui_constants.dart';
import '../../../enums/enums.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({
    Key? key,
    required this.hintText,
    required this.isError,
    required this.errorText,
    required this.onValueChange,
    required this.titleText,
    required this.isDisable,
  }) : super(key: key);

  final String hintText;
  final String titleText;
  final TypeOfEmailError isError;
  final String errorText;
  final Function onValueChange;
  final bool isDisable;

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleText,
          style: const TextStyle(
            color: textFocusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 44,
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: widget.isDisable == true ? Color.fromARGB(20, 0, 0, 0) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: widget.isError != TypeOfEmailError.none
                  ? errorTextColor
                  : Color.fromARGB(0, 255, 255, 255),
            ),
          ),
          child: TextFormField(
            showCursor: true,
            enabled: widget.isDisable == true ? false : true,
            // initialValue: '',
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: widget.isError != TypeOfEmailError.none
                  ? const Icon(
                      Icons.error_outline_rounded,
                      color: errorTextColor,
                    )
                  : Icon(
                      Icons.email,
                      color: widget.isDisable == true ? Colors.transparent : Colors.white,
                    ),
              isCollapsed: true,
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: nonActiveTextColor,
                fontSize: 14,
              ),
            ),
            onChanged: (value) {
              // if (isValidateEmail.hasMatch(value)) {}
              widget.onValueChange(value);
              // isEmailValid = false;
            },
          ),
        ),
        // Error Widget
        ErrorWidget(
          typeOfError: widget.isError,
        )
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
    required this.typeOfError,
  }) : super(key: key);

  final TypeOfEmailError typeOfError;

  @override
  Widget build(BuildContext context) {
    if (typeOfError == TypeOfEmailError.wrongEmail) {
      return Column(
        children: const [
          SizedBox(height: 10),
          Text(
            'Please enter valid credentials',
            style: TextStyle(
              color: errorTextColor,
            ),
          )
        ],
      );
    } else if (typeOfError == TypeOfEmailError.inValidEmail) {
      return Column(
        children: const [
          SizedBox(height: 10),
          Text(
            'Please enter valid Email',
            style: TextStyle(
              color: errorTextColor,
            ),
          )
        ],
      );
    } else if (typeOfError == TypeOfEmailError.emailFieldIsEmpty) {
      return Column(
        children: const [
          SizedBox(height: 10),
          Text(
            'Please Fill Email Field',
            style: TextStyle(
              color: errorTextColor,
            ),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
