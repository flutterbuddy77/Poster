import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/events/authentication_event.dart';
import 'package:poster/bloc_layer/states/authentication_state.dart';
import 'package:poster/data_layer/repositories/authentication_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with Validators {
  final AuthenticationRepository _authenticationRepository;
  final StreamController<bool> _authController = StreamController.broadcast();
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<bool> get isUserLogged => _authController.stream;

  Stream<String> get username =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Function(String) get usernameChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  AuthenticationBloc(this._authenticationRepository)
      : assert(_authenticationRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {}

  @override
  Future<void> close() async {
    await _authController?.close();
    await _emailController?.close();
    await _passwordController?.close();
    return super.close();
  }
}

mixin Validators {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    print('email validator');
    if (username.length >= 5) {
      sink.add(username);
    } else {
      sink.addError('Username is not valid!');
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8) {
      sink.add(password);
    } else {
      sink.addError('Password length shoud be greater than 8!');
    }
  });
}
