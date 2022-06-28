import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class BearAnimationWidget extends StatefulWidget {
  const BearAnimationWidget({Key? key}) : super(key: key);

  @override
  State<BearAnimationWidget> createState() => BearAnimationWidgetState();
}

class BearAnimationWidgetState extends State<BearAnimationWidget> {
  Artboard? _riveArtboard;
  // StateMachineController? _controller;
  SMIInput<bool>? _isChecking;
  SMIInput<double>? _numLook;
  SMIInput<bool>? _isHandsUp;
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'Login Machine');
    artboard.addController(controller!);
    _isChecking = controller.findInput('isChecking');
    _numLook = controller.findInput('numLook');
    _isHandsUp = controller.findInput('isHandsUp');
    _trigSuccess = controller.findSMI('trigSuccess');
    _trigFail = controller.findSMI('trigFail');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 284,
      width: 300,
      color: Colors.transparent,
      child: RiveAnimation.asset(
        'assets/login_bear.riv',
        antialiasing: true,
        fit: BoxFit.contain,
        onInit: _onRiveInit,
        stateMachines: const ['Login Machine'],
      ),
    );
  }
}
