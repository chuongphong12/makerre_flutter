import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:makerre_flutter/bloc/auth/auth_bloc.dart';
import 'package:makerre_flutter/models/storage_model.dart';
import 'package:makerre_flutter/repositories/auth_repository.dart';
import 'package:makerre_flutter/services/storage_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositories _authRepositories;
  final StorageService _storageService;
  final AuthBloc _authBloc;
  LoginBloc({
    required AuthRepositories authRepositories,
    required AuthBloc authBloc,
    required StorageService storageService,
  })  : _authRepositories = authRepositories,
        _authBloc = authBloc,
        _storageService = storageService,
        super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginExecuted);
  }

  void _onLoginExecuted(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      final token = await _authRepositories.logIn(
        email: event.email,
        password: event.password,
      );
      emit(LoginSuccess(token: token));
      await _storageService.writeSecureData(
        StorageItem('access_token', token),
      );
      _authBloc.add(const AuthenticationStatusChanged(
          AuthenticationStatus.authenticated));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(LoginFailure(error: e.toString()));
    }
  }
}
