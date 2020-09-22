import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/src/data/models/user.dart';

class IntroEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends IntroEvent {
  final UserModel user;

  final File file;

  final String phoneNumber;

  RegisterUserEvent(
      {@required this.user, @required this.file, @required this.phoneNumber});
}

class ValidatePhoneNumberEvent extends IntroEvent {
  final String phoneNumber;

  ValidatePhoneNumberEvent({this.phoneNumber});
}

class LoginPhoneNumberEvent extends IntroEvent {
  final String phoneNumber;

  LoginPhoneNumberEvent({this.phoneNumber});
}
