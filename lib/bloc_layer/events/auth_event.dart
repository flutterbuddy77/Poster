import 'package:equatable/equatable.dart';

enum AuthType {
  Email,
  Google,
  Number,
}

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignIn extends AuthEvent {
  final AuthType authType;

  SignIn(this.authType) : assert(authType != null);

  @override
  List<Object> get props => [
        authType,
      ];
}

class SignOut extends AuthEvent {
  final AuthType authType;

  SignOut(this.authType) : assert(authType != null);

  @override
  List<Object> get props => [
        authType,
      ];
}
