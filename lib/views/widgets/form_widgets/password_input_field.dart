import 'package:flutter/material.dart';

import '../../../constants/ui_constants.dart';
import '../../../enums/enums.dart';

/// `PasswordInputField` is Used Only for Password
class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    Key? key,
    required this.hintText,
    required this.isError,
    required this.errorText,
    required this.onValueChange,
    required this.titleText,
    required this.needPasswordInstruction,
  }) : super(key: key);

  final String hintText;
  final String errorText;
  final String titleText;
  final TypeOfPasswordError isError;
  final Function onValueChange;
  final bool needPasswordInstruction;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscureText = true;
  bool isPasswordHasAError = false;

  // REGx For realTime Password check
  final RegExp minCharactersRegEx = RegExp(r'^.{8,}');
  final RegExp uppercaseCharactersRegEx = RegExp(r'^(?=.*?[A-Z])');
  final RegExp lowercaseCharactersRegEx = RegExp(r'^(?=.*?[a-z])');
  final RegExp numberCharactersRegEx = RegExp(r'^(?=.*?[0-9])');
  //

  bool isPasswordHasMinCharacters = false;
  bool isPasswordHasUppercaseCharacters = false;
  bool isPasswordHasLowercaseCharacters = false;
  bool isPasswordHasNumberCharacters = false;

  // With This Function we can Check Passwrod valid or not in Realtime
  checkPasswordIsValid(String value) {
    setState(() {
      // A minimum of 8 characters
      if (minCharactersRegEx.hasMatch(value) == true) {
        isPasswordHasMinCharacters = true;
      } else {
        isPasswordHasMinCharacters = false;
      }
      // One uppercase (A-Z)
      if (uppercaseCharactersRegEx.hasMatch(value) == true) {
        isPasswordHasUppercaseCharacters = true;
      } else {
        isPasswordHasUppercaseCharacters = false;
      }
      //One lowercase letters (a-z)
      if (lowercaseCharactersRegEx.hasMatch(value) == true) {
        isPasswordHasLowercaseCharacters = true;
      } else {
        isPasswordHasLowercaseCharacters = false;
      }
      // One number (0-9)
      if (numberCharactersRegEx.hasMatch(value) == true) {
        isPasswordHasNumberCharacters = true;
      } else {
        isPasswordHasNumberCharacters = false;
      }
      //
      isPasswordHasAError = true;
      if (isPasswordHasNumberCharacters &&
          isPasswordHasLowercaseCharacters &&
          isPasswordHasUppercaseCharacters &&
          isPasswordHasMinCharacters) {
        isPasswordHasAError = false;
      }
    });
  }

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
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                width: 1,
                color: widget.isError != TypeOfPasswordError.none ? errorTextColor : Colors.white),
          ),
          child: TextFormField(
            showCursor: true,
            initialValue: '',
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObscureText,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: isObscureText
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: nonActiveTextColor,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: nonActiveTextColor,
                      ),
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
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
              widget.onValueChange(value);

              // only check RealtTime Password when Password Instructions are on screen
              if (widget.needPasswordInstruction == true) {
                checkPasswordIsValid(value);
              }
            },
          ),
        ),
        // error Message
        ErrorWidget(
          typeOfError: widget.isError,
        ),

        // if Needed for SignUP Password Instruction's
        widget.needPasswordInstruction == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Password must include at least:\n \n',
                      style: const TextStyle(color: nonActiveTextColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  *  A minimum of 8 characters\n',
                          style: TextStyle(
                            color: isPasswordHasMinCharacters ? Colors.green : nonActiveTextColor,
                          ),
                        ),
                        TextSpan(
                          text: '  *  One uppercase (A-Z)\n',
                          style: TextStyle(
                            color: isPasswordHasUppercaseCharacters
                                ? Colors.green
                                : nonActiveTextColor,
                          ),
                        ),
                        TextSpan(
                          text: '  *  One lowercase letters (a-z)\n',
                          style: TextStyle(
                            color: isPasswordHasLowercaseCharacters
                                ? Colors.green
                                : nonActiveTextColor,
                          ),
                        ),
                        TextSpan(
                          text: '  *  One number (0-9)',
                          style: TextStyle(
                            color:
                                isPasswordHasNumberCharacters ? Colors.green : nonActiveTextColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
    required this.typeOfError,
  }) : super(key: key);

  final TypeOfPasswordError typeOfError;

  @override
  Widget build(BuildContext context) {
    if (typeOfError == TypeOfPasswordError.wrongPassword) {
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
    } else if (typeOfError == TypeOfPasswordError.inValidPassword) {
      return Column(
        children: const [
          SizedBox(height: 10),
          Text(
            'Please enter valid Password',
            style: TextStyle(
              color: errorTextColor,
            ),
          )
        ],
      );
    } else if (typeOfError == TypeOfPasswordError.passwordFieldIsEmpty) {
      return Column(
        children: const [
          SizedBox(height: 10),
          Text(
            'Please Fill Password Field',
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
