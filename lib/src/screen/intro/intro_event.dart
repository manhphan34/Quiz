import 'package:equatable/equatable.dart';
import 'package:quiz/src/data/models/user.dart';

class IntroEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends IntroEvent {
  final UserModel user;

  RegisterUserEvent({this.user});
}
