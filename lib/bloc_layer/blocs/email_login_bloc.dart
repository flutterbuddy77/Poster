import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/events/login_event.dart';
import 'package:poster/bloc_layer/states/login_state.dart';
import 'package:poster/data_layer/repositories/mail_repository.dart';
import 'package:poster/utils/http_exception.dart';

class EmailBloc extends Bloc<LogInClickedEvent, LoginState> with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get username =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Function(String) get usernameChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  final MailRepository _mailRepository;

  EmailBloc(this._mailRepository) : assert(_mailRepository != null);

  @override
  LoginState get initialState => InitializedLoginState();

  @override
  Stream<LoginState> mapEventToState(LogInClickedEvent event) async* {
    if (event is LogInClickedEvent) {
      try {
        yield LoadingLoginState();

        await _mailRepository.registerWithEmail(
          event.username,
          event.password,
        );

        print('completed');
        yield SuccessLoginState();
      } on HttpException catch (error) {
        yield ErrorLoginState(error.errorMessage);
      } catch (error) {
        yield ErrorLoginState(error);
      }
    }
  }

  @override
  Future<void> close() async {
    await _emailController?.close();
    await _passwordController?.close();
    return super.close();
  }
}

mixin Validators {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
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
