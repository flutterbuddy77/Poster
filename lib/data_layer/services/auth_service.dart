import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _user = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  /// Method for register with email and password in firebase
  Future<FirebaseUser> registerWithEmail(String email, String password) async {
    FirebaseUser user;

    AuthResult result = await _user.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = result.user;
    return user;
  }

  /// use it for google sign in
  Future<FirebaseUser> signInWithGoogle() async {
    // code of google sign in/ register
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    final FirebaseUser user =
        (await _user.signInWithCredential(credential)).user;
    return user;
  }

  Future<FirebaseUser> registerWithNumber() async {
    // TODO: implement code of phone sign in / register
  }

  Future emailSignOut() async {
    await _user.signOut();
  }

  Future googleSignOut() async {
    await _user.signOut();
    await _googleSignIn.signOut();
  }
}
