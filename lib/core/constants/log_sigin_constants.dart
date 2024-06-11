import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_sigin_constants.g.dart';

class LogSiginConstants {
  final String txtTitleLogin = 'Enter your details';
  final String txtHintEmail = 'Enter your E-mail';
  final String txtHintName = 'Enter your name';
  final String txtHintPass = 'Enter your passWord';
  final String txtLogin = 'Login';
  final String txtSignin = 'Sign In';
  final String txtCreateAc = 'create account ';
  final String txtAlreadySign = 'Already have an accout?Log in';
}

@riverpod
LogSiginConstants logSiginConstants(LogSiginConstantsRef ref) {
  return LogSiginConstants();
}
