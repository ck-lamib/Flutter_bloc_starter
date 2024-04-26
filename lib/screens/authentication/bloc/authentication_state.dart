part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? user;
  final Token? token;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
    this.token,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated({
    required User user,
    required Token token,
  }) : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
          token: token,
        );

  const AuthenticationState.unauthenticated()
      : this._(
          status: AuthenticationStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [status, user, token];
}
