import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/data/models/user_rank.dart';

class UserState {}

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

class UserGetTitlesState extends UserState {
  final List<TitleData> titles;

  UserGetTitlesState({this.titles});
}

class UserUpdateStatusTitleState extends UserState {}

class UserCheckTitleState extends UserState {
  final TitleData title;

  UserCheckTitleState(this.title);
}

class GetAllUserState extends UserState {
  final List<UserRank> ranks;

  GetAllUserState(this.ranks);
}

class UserUpdateCoverImageState extends UserState {
  final UserData user;

  UserUpdateCoverImageState({this.user});
}
