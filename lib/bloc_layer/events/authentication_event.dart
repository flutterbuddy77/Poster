import 'package:equatable/equatable.dart';
import '../auth_types.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class RegisterUer extends AuthenticationEvent {
  final String email;
  final String password;

  RegisterUer(
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class SignIn extends AuthenticationEvent {
  final AuthType authType;

  SignIn(this.authType) : assert(authType != null);

  @override
  List<Object> get props => [
        authType,
      ];
}

class SignOut extends AuthenticationEvent {
  final AuthType authType;

  SignOut(this.authType) : assert(authType != null);

  @override
  List<Object> get props => [
        authType,
      ];
}
