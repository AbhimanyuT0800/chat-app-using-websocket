import 'package:chat_using_websocket/controller/auth/auth_state.dart';
import 'package:chat_using_websocket/core/exception/base_exception/base_exception.dart';
import 'package:chat_using_websocket/services/auth_services.dart';
import 'package:chat_using_websocket/services/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  UserStateProvider build() {
    return UserStateProvider(isLoading: false, user: null);
  }

// get update of user
  void updateUser() {
    AuthServices.authStatus().listen(
      (event) {
        state = state.copyWith(user: event);
      },
    );
  }

// signin with email
  void signInWithEmail(
      {required BuildContext context,
      required String email,
      required String pass,
      required String userName}) async {
    state = state.copyWith(isLoading: true);
    try {
      await AuthServices.userSigninWithEmail(
          email: email, pass: pass, userName: userName);
      FirestoreServices.addUserToFirestore(name: userName, email: email);
    } on BaseException catch (e) {
      Future.sync(
        () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message))),
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

// login for already an user
  void logInwithEmail(
      {required BuildContext context,
      required String email,
      required String pass}) async {
    state = state.copyWith(isLoading: true);
    try {
      await AuthServices.userLoginWithEmail(email: email, password: pass);
    } on BaseException catch (e) {
      Future.sync(
        () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message))),
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

@riverpod
Stream<User?> isUserLogin(IsUserLoginRef ref) {
  return AuthServices.authStatus();
}
