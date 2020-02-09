import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/events/authentication_event.dart';
import 'package:poster/bloc_layer/states/authentication_state.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {}
}
