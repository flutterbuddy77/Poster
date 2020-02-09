import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/events/auth_event.dart';
import 'package:poster/bloc_layer/states/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {}
}
