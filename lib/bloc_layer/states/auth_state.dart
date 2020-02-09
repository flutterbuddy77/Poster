import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthenticationUninitialized extends AuthState {
  @override
  List<Object> get props => null;
}

class ErrorHappened extends AuthState {
  final String errorMesage;

  ErrorHappened(this.errorMesage) : assert(errorMesage != null);

  @override
  List<Object> get props => [
        errorMesage,
      ];
}

class SuccessAuthentication extends AuthState {
  @override
  List<Object> get props => null;
}

class LoadingAuthentication extends AuthState {
  @override
  List<Object> get props => null;
}
