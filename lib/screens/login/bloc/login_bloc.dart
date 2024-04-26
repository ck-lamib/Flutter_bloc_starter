import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_folder_str/app/failure.dart';
import 'package:clean_folder_str/screens/login/domain/usecase/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  bool _isPasswordVisible = false;

  LoginBloc({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  FutureOr<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    var result = await _loginUseCase.login(
      email: event.userName,
      password: event.password,
    );
    result.fold(
      (error) {
        if (error is ApiFailure) {
          return emit(
            LoginFailure(
              error: error.error!.fieldErrors.entries.first.value,
            ),
          );
        }
        return emit(LoginFailure(error: error.message));
      },
      (data) {
        return emit(const LoginSuccess());
      },
    );
  }

  FutureOr<void> _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<LoginState> emit) {
    _isPasswordVisible = !_isPasswordVisible;
    emit(LoginPasswordVisibilityChanged(_isPasswordVisible));
  }
}
