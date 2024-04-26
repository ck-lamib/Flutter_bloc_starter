part of 'login_bloc.dart';

// enum LoginStatus { initial, inprogress, success, failure }

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginPasswordVisibilityChanged extends LoginState {
  final bool isPasswordVisible;

  const LoginPasswordVisibilityChanged(this.isPasswordVisible);

  @override
  List<Object> get props => [isPasswordVisible];
}
