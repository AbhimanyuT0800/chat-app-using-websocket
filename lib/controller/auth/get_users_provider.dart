import 'package:chat_using_websocket/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_users_provider.g.dart';

// All user provider

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(GetAllUsersRef ref) {
  return FirestoreServices().getAllUsers();
}
