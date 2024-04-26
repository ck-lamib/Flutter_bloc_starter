import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_folder_str/models/token_model.dart';
import 'package:clean_folder_str/models/user_model.dart';
import 'package:clean_folder_str/screens/authentication/domain/usecase/authentication_usecase.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationUseCase _authenticationUseCase;

  AuthenticationBloc({
    required AuthenticationUseCase authenticationUseCase,
  })  : _authenticationUseCase = authenticationUseCase,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
  }

  FutureOr<void> _onAuthenticationStatusChanged(
      AuthenticationStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.unknown());

    var authData = await _authenticationUseCase.getAuthCredentialData();
    return authData.fold(
      (error) {
        return emit(
          const AuthenticationState.unauthenticated(),
        );
      },
      (data) {
        return data.user != null && data.token != null
            ? emit(
                AuthenticationState.authenticated(
                  user: data.user!,
                  token: data.token!,
                ),
              )
            : emit(
                const AuthenticationState.unauthenticated(),
              );
      },
    );
  }

  FutureOr<void> _onAuthenticationLogoutRequested(
      AuthenticationLogoutRequested event,
      Emitter<AuthenticationState> emit) async {
    var result = await _authenticationUseCase.deleteAuthCredentialData();
    result.fold(
      (error) {},
      (data) {
        return emit(
          const AuthenticationState.unauthenticated(),
        );
      },
    );
  }
}
