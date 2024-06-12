import 'package:chat_using_websocket/model/message_firestore_model.dart';
import 'package:chat_using_websocket/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_message_provider.g.dart';

// get all message

@riverpod
Stream<QuerySnapshot<MessageFirestoreModel>> getAllMessages(
    GetAllMessagesRef ref) {
  return FirestoreServices.getAllChats();
}
