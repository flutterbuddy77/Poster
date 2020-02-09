import 'package:equatable/equatable.dart';

abstract class GoogleState extends Equatable {
  const GoogleState();
}

class UninitializedState extends GoogleState {
  @override
  List<Object> get props => null;
}

class ErrorHappened extends GoogleState {
  final String errorMessage;

  ErrorHappened(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SuccessSignIn extends GoogleState {
  @override
  List<Object> get props => null;
}

class LoadingSignIn extends GoogleState {
  @override
  List<Object> get props => null;
}
