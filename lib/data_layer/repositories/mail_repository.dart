import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:poster/data_layer/repositories/sign_out.dart';
import 'package:poster/data_layer/services/auth_service.dart';
import 'package:poster/utils/http_exception.dart';

class MailRepository implements SignOut {
  final AuthenticationService _firebaseService;

  MailRepository(this._firebaseService) : assert(_firebaseService != null);

  Future<FirebaseUser> registerWithEmail(String email, String password) async {
    FirebaseUser user;

    try {
      user = await _firebaseService.registerWithEmail(email, password);
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
