import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:makerre_flutter/models/user_model.dart' as user_model;
import 'package:makerre_flutter/repositories/auth_repository.dart';
import 'package:makerre_flutter/repositories/user_repository.dart';
import 'package:makerre_flutter/services/storage_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories _authRepositories;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;
  final StorageService _storageService;

  AuthBloc({
    required AuthRepositories authRepositories,
    required StorageService storageService,
    required UserRepository userRepository,
  })  : _authRepositories = authRepositories,
        _storageService = storageService,
        _userRepository = userRepository,
        super(const AuthState.unknown()) {
    on<LoggedOut>(_onLoggedOut);
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    _authenticationStatusSubscription = _authRepositories.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authRepositories.dispose();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final String? accessToken = await _storageService.readSecureData('access_token');
        return emit(
          accessToken != ''
              ? AuthState.authenticated(accessToken!)
              : const AuthState.unauthenticated(),
        );
      case AuthenticationStatus.unknown:
        return emit(const AuthState.unknown());
    }
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    await _storageService.deleteAllSecureData();
    _authRepositories.logOut();
  }

  Future<user_model.User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
