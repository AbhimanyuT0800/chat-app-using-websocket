import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_firestore_model.freezed.dart';

@freezed
class MessageFirestoreModel with _$MessageFirestoreModel {
  const factory MessageFirestoreModel(
      {required String message,
      required String sender,
      required int timestamp}) = _MessageFirestoreModel;

  factory MessageFirestoreModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return MessageFirestoreModel(
        timestamp: snapshot.data()?['timestamp'] ?? 0,
        message: snapshot.data()!['message'],
        sender: snapshot.data()!['sender']);
  }

  static Map<String, dynamic> toFirestore(
      MessageFirestoreModel contact, SetOptions? options) {
    return {
      'timestamp': contact.timestamp,
      'message': contact.message,
      'sender': contact.sender,
    };
  }
}
