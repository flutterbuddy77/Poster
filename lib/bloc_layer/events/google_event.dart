import 'package:equatable/equatable.dart';

abstract class GoogleEvent extends Equatable {
  const GoogleEvent();
}

class SignInWithGoogleClicked extends GoogleEvent {
  @override
  List<Object> get props => null;
}
