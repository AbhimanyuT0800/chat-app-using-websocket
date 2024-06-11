import 'package:chat_using_websocket/core/exception/auth_exceptions/auth_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthServices {
  static final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  static Stream<User?> authStatus() => auth.authStateChanges();

  static Future<void> userSigninWithEmail(
      {required String email,
      required String pass,
      required String userName}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: pass);
      auth.currentUser?.updateDisplayName(userName);
    } on FirebaseAuthException catch (e) {
      throw AuthException(error: e.message);
    }
  }

  static Future<UserCredential> userLoginWithEmail(
      {required String email, required String password}) async {
    try {
      return auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw AuthException(error: e.toString());
    }
  }

  static Future<void> userLogOut() async {
    await auth.signOut();
  }
}

final verificationIdProvider = StateProvider<String?>((ref) => null);
