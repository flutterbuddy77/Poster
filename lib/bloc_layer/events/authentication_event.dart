import 'package:equatable/equatable.dart';

enum AuthType {
  Email,
  Google,
  Number,
}

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
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
