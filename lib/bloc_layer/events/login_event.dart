import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LogInClickedEvent extends LoginEvent {
  final String username;
  final String password;

  LogInClickedEvent(
    this.username,
    this.password,
  );

  @override
  List<Object> get props => [
        username,
        password,
      ];
}

class SignOutClicked extends LoginEvent {
  @override
  List<Object> get props => null;
}
