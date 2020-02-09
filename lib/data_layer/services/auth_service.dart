import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  /// Method for register with email and password in firebase
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

  /// use it for google sign in
  Future<FirebaseUser> signInWithGoogle() async {
    // code of google sign in/ register
    GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    final FirebaseUser user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    return user;
  }

  Future<FirebaseUser> registerWithNumber() async {
    // TODO: implement code of phone sign in / register
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
