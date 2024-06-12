import 'package:chat_using_websocket/core/exception/auth_exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

// authantication services
class AuthServices {
  static final auth = FirebaseAuth.instance;

// auth status updates
  static Stream<User?> authStatus() => auth.authStateChanges();

// new user sign in
  static Future<void> userSigninWithEmail(
      {required String email,
      required String pass,
      required String userName}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: pass);
      await auth.currentUser?.updateDisplayName(userName);
    } on FirebaseAuthException catch (e) {
      throw AuthException(error: e.message);
    }
  }

// already have an account user login
  static Future<UserCredential> userLoginWithEmail(
      {required String email, required String password}) async {
    try {
      return auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw AuthException(error: e.toString());
    }
  }

// user log out
  static Future<void> userLogOut() async {
    await auth.signOut();
  }
}
