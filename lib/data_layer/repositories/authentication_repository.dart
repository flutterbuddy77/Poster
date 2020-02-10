import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:poster/bloc_layer/auth_types.dart';
import 'package:poster/data_layer/services/auth_service.dart';
import 'package:poster/utils/http_exception.dart';

class AuthenticationRepository {
  final AuthenticationService _authenticationService;
  bool isUsersLogged = false;

  AuthenticationRepository(this._authenticationService)
      : assert(_authenticationService != null);

  Future<FirebaseUser> registerWithEmail(String email, String password) async {
    FirebaseUser user;
    try {
      final user =
          await _authenticationService.registerWithEmail(email, password);
      if (user != null) isUsersLogged = true;
    } on PlatformException catch (error) {
      throw HttpException(error.message);
    } catch (error) {
      throw HttpException(error);
    }
    return user;
  }

  Future<FirebaseUser> googleSignIn() async {
    FirebaseUser user;
    try {
      final user = await _authenticationService.signInWithGoogle();
      if (user != null) isUsersLogged = true;
    } on PlatformException catch (error) {
      throw HttpException(error.message);
    } catch (error) {
      throw HttpException(error);
    }
    return user;
  }

  Future<void> signOut(AuthType authType) async {
    switch (authType) {
      case AuthType.Email:
        await _authenticationService.emailSignOut();
        break;
      case AuthType.Google:
        await _authenticationService.emailSignOut();
        await _authenticationService.googleSignOut();
        break;
      case AuthType.Number:
        break;
      default:
    }
  }
}
