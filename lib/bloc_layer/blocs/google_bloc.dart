import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/bloc_layer/events/google_event.dart';
import 'package:poster/bloc_layer/states/google_state.dart';
import 'package:poster/data_layer/repositories/google_sign_in_repository.dart';
import 'package:poster/utils/http_exception.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  final GoogleSignInRepository _googleSignInRepository;

  GoogleBloc(this._googleSignInRepository)
      : assert(_googleSignInRepository != null);

  @override
  GoogleState get initialState => UninitializedState();

  @override
  Stream<GoogleState> mapEventToState(GoogleEvent event) async* {
    if (event is SignInWithGoogleClicked) {
      yield LoadingSignIn();

      try {
        final user = await _googleSignInRepository.signInWithGoogle();
        if (user != null) yield SuccessSignIn();
      } on HttpException catch (error) {
        yield ErrorHappened(error.errorMessage);
      } catch (error) {
        yield ErrorHappened(error);
      }
    }
  }
}
