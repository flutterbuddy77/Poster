import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:poster/data_layer/services/firebase_service.dart';
import 'package:poster/utils/http_exception.dart';

class MailRepository {
  final FirebaseService _firebaseService;

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
}