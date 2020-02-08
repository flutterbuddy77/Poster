import 'package:equatable/equatable.dart';

class LogInClickedEvent extends Equatable {
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
