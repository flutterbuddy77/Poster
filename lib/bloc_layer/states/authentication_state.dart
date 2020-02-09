import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  List<Object> get props => null;
}

class ErrorHappened extends AuthenticationState {
  final String errorMesage;

  ErrorHappened(this.errorMesage) : assert(errorMesage != null);

  @override
  List<Object> get props => [
        errorMesage,
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
