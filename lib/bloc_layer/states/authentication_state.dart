import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class ErrorHappened extends AuthenticationState {
  final String errorMessage;

  ErrorHappened(this.errorMessage) : assert(errorMessage != null);

  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class SuccessAuthentication extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class LoadingAuthentication extends AuthenticationState {
  @override
  List<Object> get props => null;
}
