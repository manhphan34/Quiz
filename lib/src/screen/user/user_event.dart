import 'package:quiz/src/data/models/user.dart';

class UserEvent{
}

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

class UserUdpatePointEvent extends UserEvent {
  final int id;
  final int ePoint;
  final int mPoint;
  final int hPoint;

  UserUdpatePointEvent({this.id, this.ePoint, this.mPoint, this.hPoint});
}
