import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class UserStateProvider with _$UserStateProvider {
  factory UserStateProvider({required bool isLoading, User? user}) =
      _UserStateProvider;
}
