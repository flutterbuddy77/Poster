import 'package:firebase_auth/firebase_auth.dart';
import 'package:poster/data_layer/repositories/sign_out.dart';
import 'package:poster/data_layer/services/auth_service.dart';
import 'package:poster/utils/http_exception.dart';
import 'package:flutter/services.dart';

class GoogleSignInRepository implements SignOut {
  final AuthenticationService _firebaseService;

  GoogleSignInRepository(this._firebaseService)
      : assert(_firebaseService != null);

  Future<FirebaseUser> signInWithGoogle() async {
    FirebaseUser user;

    try {
      user = await _firebaseService.signInWithGoogle();
    } on PlatformException catch (error) {
      throw HttpException(error.message);
    } catch (error) {
      throw HttpException(error);
    }

    return user;
  }

  @override
  Future signOut() async {
    await _firebaseService.signOut();
  }
}
