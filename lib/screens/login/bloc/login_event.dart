part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String userName;
  final String password;
  const LoginSubmitted({required this.userName, required this.password});
}

class TogglePasswordVisibility extends LoginEvent {
  // final bool isHidePassword;
  // const ToogleHidePassword({required this.isHidePassword});
}
