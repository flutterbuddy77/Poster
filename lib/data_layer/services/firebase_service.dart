import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<FirebaseUser> registerWithEmail(String email, String password) async {
    FirebaseUser user;

    AuthResult result =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = result.user;
    return user;
  }

  Future<FirebaseUser> registerWithGoogle() async {
    // implement code of google sign in/ register
  }

  Future<FirebaseUser> registerWithNumber() async {
    // implement code of phone sign in / register
  }
}
