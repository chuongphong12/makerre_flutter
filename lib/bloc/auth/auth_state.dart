part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthenticationStatus status;
  final String accessToken;

  const AuthState._({
    this.status = AuthenticationStatus.unknown,
    this.accessToken = '',
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated(String accessToken)
      : this._(
          status: AuthenticationStatus.authenticated,
          accessToken: accessToken,
        );

  const AuthState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, accessToken];
}
