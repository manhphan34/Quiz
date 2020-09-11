import 'package:quiz/src/data/local/database.dart';

class UserState{
}

class UserInitialState extends UserState {}

class RegisterUserSuccess extends UserState {}

class RegisterUserFail extends UserState {}

class UserLoadedInformationState extends UserState {
  final UserData user;

  UserLoadedInformationState({this.user});
}

class UserLoadUpdateAvatarState extends UserState {
  final String path;

  UserLoadUpdateAvatarState({this.path});
}

class UserLoadUpdateCoverImageState extends UserState {
  final String path;

  UserLoadUpdateCoverImageState({this.path});
}

class UserLoadedPointState extends UserState {
  final PointData point;

  UserLoadedPointState({this.point});
}
