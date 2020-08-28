import 'package:equatable/equatable.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/data/models/User.dart';

class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends UserEvent {
  final UserModel user;

  RegisterUserEvent({this.user});
}
