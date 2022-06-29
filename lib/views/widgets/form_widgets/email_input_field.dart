import 'package:flutter/material.dart';

import '../../../constants/ui_constants.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({
    Key? key,
    required this.hintText,
    required this.isError,
    required this.errorText,
    required this.onValueChange,
    required this.titleText,
    this.isDisable,
  }) : super(key: key);

  final String hintText;
  final String titleText;
  final bool isError;
  final String errorText;
  final Function onValueChange;
  final bool? isDisable;

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  RegExp isValidateEmail =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

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
            color: widget.isDisable == null ? Color.fromARGB(20, 0, 0, 0) : Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: widget.isError == true ? errorTextColor : Color.fromARGB(0, 255, 255, 255),
            ),
          ),
          child: TextFormField(
            showCursor: true,
            enabled: widget.isDisable,
            initialValue: '',
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: widget.isError == true
                  ? const Icon(
                      Icons.error_outline_rounded,
                      color: errorTextColor,
                    )
                  : const Icon(
                      Icons.email,
                      color: Colors.white,
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
              // isEmailValid = false;
              widget.onValueChange(value);
            },
          ),
        ),
        // error Message
        widget.isError == true
            ? Column(
                children: const [
                  SizedBox(height: 10),
                  Text(
                    'This email is not registered with us. Please check and re-enter your email.',
                    style: TextStyle(
                      color: errorTextColor,
                    ),
                  )
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
