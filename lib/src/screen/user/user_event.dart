import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:quiz/src/data/models/user.dart';

class UserEvent {}

class RegisterUserEvent extends UserEvent {
  final UserModel user;

  RegisterUserEvent({this.user});
}

class UserLoadInformationEvent extends UserEvent {}

class UserLoadUpdateAvatarEvent extends UserEvent {
  final String path;

  UserLoadUpdateAvatarEvent({this.path});
}

class UserLoadUpdateCoverImageEvent extends UserEvent {
  final String path;

  UserLoadUpdateCoverImageEvent({this.path});
}

class UserLoadPointEvent extends UserEvent {}

class UserUpdatePointEvent extends UserEvent {
  final int id;
  final int ePoint;
  final int mPoint;
  final int hPoint;
  final int rankPoint;

  UserUpdatePointEvent(
      {this.id, this.ePoint, this.mPoint, this.hPoint, this.rankPoint});
}

class UserUpdateMedalEvent extends UserEvent {
  final int id;
  final String mobile;
  final int bronzePoint;
  final int silverPoint;
  final int goldPoint;
  final int rankPoint;
  final int ePoint;
  final int mPoint;
  final int hPoint;

  UserUpdateMedalEvent(
      {this.id,
      @required this.mobile,
      this.bronzePoint,
      this.silverPoint,
      this.goldPoint,
      this.rankPoint,
      this.ePoint,
      this.mPoint,
      this.hPoint});
}

class UserGetTitlesEvent extends UserEvent {}

class UserUpdateStatusTitleEvent extends UserEvent {
  final String mobile;
  final String title;
  final int currentTitleId;
  final int newTitleId;
  final String status;

  UserUpdateStatusTitleEvent(
      {@required this.mobile,
      @required this.title,
      @required this.currentTitleId,
      @required this.newTitleId,
      @required this.status});
}

class UserCheckTitleEvent extends UserEvent {
  final int goldPoint;
  final int silverPoint;
  final int bronzePoint;

  UserCheckTitleEvent(this.goldPoint, this.silverPoint, this.bronzePoint);
}

class GetAllUserEvent extends UserEvent {}

class UserUpdateCoverImageEvent extends UserEvent {
  final File file;

  UserUpdateCoverImageEvent({@required this.file});
}

class UserSignOutEvent extends UserEvent{}