import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterUserSuccess extends UserState {}

class RegisterUserFail extends UserState {}
